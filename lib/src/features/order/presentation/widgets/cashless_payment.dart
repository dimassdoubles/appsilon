import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CashlessPayment extends StatefulWidget {
  const CashlessPayment({super.key});

  @override
  State<CashlessPayment> createState() => _CashlessPaymentState();
}

class _CashlessPaymentState extends State<CashlessPayment> {
  final WebViewController _webviewCtrl = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(
        'https://app.sandbox.midtrans.com/snap/v3/redirection/0dab6405-1c0f-44e3-a3b9-c47f9dd0b601'));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _webviewCtrl);
  }
}
