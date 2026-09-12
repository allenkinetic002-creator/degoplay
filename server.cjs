const http = require('http');
const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

const PORT = parseInt(process.env.PORT || process.argv[2] || '8080', 10);
const BUILD_DIR = path.join(__dirname, 'build', 'web');

const MIME_TYPES = {
  '.html': 'text/html; charset=UTF-8',
  '.js': 'text/javascript; charset=UTF-8',
  '.css': 'text/css; charset=UTF-8',
  '.json': 'application/json; charset=UTF-8',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon',
  '.wasm': 'application/wasm',
  '.ttf': 'font/ttf',
  '.otf': 'font/otf',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2'
};

// Types that benefit from gzip compression
const COMPRESSIBLE_EXTS = new Set([
  '.html', '.js', '.css', '.json', '.svg', '.wasm', '.ttf', '.otf'
]);

// In-memory cache for blazing fast responses
const cache = new Map();

function getCachedFile(filePath) {
  try {
    const stats = fs.statSync(filePath);
    const etag = `W/"${stats.size}-${Math.floor(stats.mtimeMs)}"`;
    
    const cached = cache.get(filePath);
    if (cached && cached.mtimeMs === stats.mtimeMs) {
      return cached;
    }

    const content = fs.readFileSync(filePath);
    const ext = path.extname(filePath).toLowerCase();
    
    let gzipped = null;
    if (COMPRESSIBLE_EXTS.has(ext)) {
      gzipped = zlib.gzipSync(content, { level: 6 });
    }

    const fileData = {
      content,
      gzipped,
      etag,
      mtimeMs: stats.mtimeMs,
      mtime: stats.mtime.toUTCString(),
      contentType: MIME_TYPES[ext] || 'application/octet-stream',
      ext
    };

    cache.set(filePath, fileData);
    return fileData;
  } catch (e) {
    return null;
  }
}

const server = http.createServer((req, res) => {
  let reqPath = decodeURI(req.url.split('?')[0]);
  if (reqPath === '/' || reqPath === '') {
    reqPath = '/index.html';
  }

  let filePath = path.join(BUILD_DIR, reqPath);
  if (!filePath.startsWith(BUILD_DIR)) {
    res.writeHead(403);
    return res.end('Forbidden');
  }

  let fileData = getCachedFile(filePath);
  if (!fileData) {
    filePath = path.join(BUILD_DIR, 'index.html');
    fileData = getCachedFile(filePath);
  }

  if (!fileData) {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    return res.end('Not Found');
  }

  const isHtml = fileData.ext === '.html';

  // Check client ETag for instant 304 Not Modified
  const ifNoneMatch = req.headers['if-none-match'];
  if (ifNoneMatch && ifNoneMatch === fileData.etag) {
    res.writeHead(304, {
      'Access-Control-Allow-Origin': '*',
      'ETag': fileData.etag,
      'Cache-Control': 'no-cache, no-store, must-revalidate'
    });
    return res.end();
  }

  // Always force revalidation so fresh builds are loaded immediately
  const cacheControl = 'no-cache, no-store, must-revalidate';

  const acceptEncoding = req.headers['accept-encoding'] || '';
  const canGzip = fileData.gzipped && acceptEncoding.includes('gzip');

  const headers = {
    'Content-Type': fileData.contentType,
    'Access-Control-Allow-Origin': '*',
    'ETag': fileData.etag,
    'Last-Modified': fileData.mtime,
    'Cache-Control': cacheControl
  };

  if (canGzip) {
    headers['Content-Encoding'] = 'gzip';
    headers['Vary'] = 'Accept-Encoding';
    res.writeHead(200, headers);
    res.end(fileData.gzipped);
  } else {
    headers['Content-Length'] = fileData.content.length;
    res.writeHead(200, headers);
    res.end(fileData.content);
  }
});

server.listen(PORT, '0.0.0.0', () => {
  console.log(`⚡ DANA Lightning-Fast Web Server running at http://localhost:${PORT}/`);
});
