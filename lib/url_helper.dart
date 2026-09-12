import 'package:web/web.dart' as web;

void openUrl(String url) {
  // Using an anchor element click() is the only reliable way to open a new tab
  // from Flutter Web. window.open() gets silently blocked by the browser popup
  // policy when called from Flutter's canvas event system.
  try {
    final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = url;
    anchor.target = '_blank';
    anchor.rel = 'noopener noreferrer';
    web.document.body!.appendChild(anchor);
    anchor.click();
    web.document.body!.removeChild(anchor);
  } catch (e) {
    // Fallback
    web.window.open(url, '_blank');
  }
}
