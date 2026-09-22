const fs = require('fs');
const path = require('path');

const downloads = 'C:\\Users\\Allen\\Downloads';
const projectRoot = 'C:\\Users\\Allen\\.gemini\\antigravity-ide\\scratch\\dana_web';

const degoSrc = path.join(downloads, 'dego.png');
const fqSrc = path.join(downloads, 'fq.png');
const faSrc = path.join(downloads, 'fa.png');
const fbSrc = path.join(downloads, 'fb.png');
const fcSrc = path.join(downloads, 'fc.png');
const fdSrc = path.join(downloads, 'fd.png');
const feSrc = path.join(downloads, 'fe.png');
const ffSrc = fs.existsSync(path.join(downloads, 'ff).png'))
  ? path.join(downloads, 'ff).png')
  : path.join(downloads, 'ff.png');
const doseUpSrc = path.join(downloads, 'download (1).png');

console.log('degoSrc exists:', fs.existsSync(degoSrc));
console.log('fqSrc exists:', fs.existsSync(fqSrc));
console.log('faSrc exists:', fs.existsSync(faSrc));
console.log('fbSrc exists:', fs.existsSync(fbSrc));
console.log('fcSrc exists:', fs.existsSync(fcSrc));
console.log('fdSrc exists:', fs.existsSync(fdSrc));
console.log('feSrc exists:', fs.existsSync(feSrc));
console.log('ffSrc exists:', fs.existsSync(ffSrc));
console.log('doseUpSrc exists:', fs.existsSync(doseUpSrc));

const targets = [
  // dego.png -> dana4.png (Hero Title Logo)
  { src: degoSrc, dest: path.join(projectRoot, 'assets', 'images', 'dana4.png') },
  { src: degoSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'dana4.png') },
  { src: degoSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'dana4.png') },

  // fq.png -> dana1.png (Hero Mascot)
  { src: fqSrc, dest: path.join(projectRoot, 'assets', 'images', 'dana1.png') },
  { src: fqSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'dana1.png') },
  { src: fqSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'dana1.png') },

  // fa.png -> ed.png (Vision Section Mascot)
  { src: faSrc, dest: path.join(projectRoot, 'assets', 'images', 'ed.png') },
  { src: faSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'ed.png') },
  { src: faSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'ed.png') },

  // fb.png -> fb.png and dana2.png (Cocktail Mouse Beside Hero Mascot on Left)
  { src: fbSrc, dest: path.join(projectRoot, 'assets', 'images', 'fb.png') },
  { src: fbSrc, dest: path.join(projectRoot, 'assets', 'images', 'dana2.png') },
  { src: fbSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'fb.png') },
  { src: fbSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'dana2.png') },
  { src: fbSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'fb.png') },
  { src: fbSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'dana2.png') },

  // fc.png -> close.png and dana_coin.jpg (Token Section Coin Mascot)
  { src: fcSrc, dest: path.join(projectRoot, 'assets', 'images', 'close.png') },
  { src: fcSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'close.png') },
  { src: fcSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'close.png') },
  { src: fcSrc, dest: path.join(projectRoot, 'assets', 'images', 'dana_coin.jpg') },
  { src: fcSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'dana_coin.jpg') },
  { src: fcSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'dana_coin.jpg') },

  // fd.png -> open.png (Token DANA Section Header Logo)
  { src: fdSrc, dest: path.join(projectRoot, 'assets', 'images', 'open.png') },
  { src: fdSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'open.png') },
  { src: fdSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'open.png') },

  // fe.png -> dana5.png (CTA "Ready for your dose dana" Mascot)
  { src: feSrc, dest: path.join(projectRoot, 'assets', 'images', 'dana5.png') },
  { src: feSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'dana5.png') },
  { src: feSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'dana5.png') },

  // ff).png -> danafam.png (CTA Section DEGOPLAY FAM Badge)
  { src: ffSrc, dest: path.join(projectRoot, 'assets', 'images', 'danafam.png') },
  { src: ffSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'danafam.png') },
  { src: ffSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'danafam.png') },

  // ff).png -> dana3.png & dana.png (Navbar & Footer Brand Logo replaced with DEGOPLAY FAM)
  { src: ffSrc, dest: path.join(projectRoot, 'assets', 'images', 'dana3.png') },
  { src: ffSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'dana3.png') },
  { src: ffSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'dana3.png') },
  { src: ffSrc, dest: path.join(projectRoot, 'assets', 'images', 'dana.png') },
  { src: ffSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'dana.png') },
  { src: ffSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'dana.png') },

  // download (1).png -> dose_up.png (Vision Section DOSE UP Badge)
  { src: doseUpSrc, dest: path.join(projectRoot, 'assets', 'images', 'dose_up.png') },
  { src: doseUpSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'assets', 'images', 'dose_up.png') },
  { src: doseUpSrc, dest: path.join(projectRoot, 'build', 'web', 'assets', 'images', 'dose_up.png') },
];

for (const t of targets) {
  if (fs.existsSync(path.dirname(t.dest))) {
    fs.copyFileSync(t.src, t.dest);
    console.log(`Copied ${path.basename(t.src)} -> ${t.dest} (${fs.statSync(t.dest).size} bytes)`);
  }
}

console.log('ALL ASSETS SYNCED SUCCESSFULLY!');
