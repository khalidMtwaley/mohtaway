 import 'package:flutter/material.dart';
 import 'package:webview_flutter/webview_flutter.dart';


class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://mohtaway.com/'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:InkWell(
          onTap: () async{
    if (await controller.canGoBack()) {
    controller.goBack();
          }else{
    Navigator.maybePop(context);
    }
          },
          child:  const Icon(Icons.arrow_back,size: 30,),
        ),
        backgroundColor: Color(0xff04979e),
        elevation: 0,
      ),
      body:
      WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: SafeArea(

            child: WebViewWidget(
                controller:controller),

        ),
      ),
    );
  }
}
