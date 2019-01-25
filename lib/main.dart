import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  final title = 'BefittingLife Academy';
  final url = 'https://befittinglife.com';
  final themeData = ThemeData(
    primaryColor: const Color(0xFF02BB9F),
    primaryColorDark: const Color(0xFF167F67),
    accentColor: const Color(0xFFFFAD32),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.android
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: this.title,
            home: SafeArea(
                child: WebviewScaffold(
              enableAppScheme: true,
              hidden: true,
              withLocalUrl: true,
              url: this.url,
              withJavascript: true,
              withLocalStorage: true,
              withZoom: false,
              allowFileURLs: true,
              appCacheEnabled: true,
              appBar: AppBar(
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      flutterWebViewPlugin.goBack();
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.autorenew,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      flutterWebViewPlugin.reload();
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      flutterWebViewPlugin.goForward();
                    },
                  ),
                ],
              ),
              bottomNavigationBar: BottomAppBar(
                color: this.themeData.primaryColor,
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
//                    IconButton(
//                      icon: const Icon(Icons.arrow_back_ios),
//                      onPressed: () {
//                        flutterWebViewPlugin.goBack();
//                      },
//                    ),
//                    IconButton(
//                      icon: const Icon(Icons.arrow_forward_ios),
//                      onPressed: () {
//                        flutterWebViewPlugin.goForward();
//                      },
//                    ),
//                    IconButton(
//                      icon: const Icon(Icons.autorenew),
//                      onPressed: () {
//                        flutterWebViewPlugin.reload();
//                      },
//                    ),
                    FlatButton(
                      child: IntrinsicHeight(
                          child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                      onPressed: () {
                        flutterWebViewPlugin.reloadUrl(url);
                      },
                    ),
                    FlatButton(
                      child: IntrinsicHeight(
                          child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.dashboard,
                            color: Colors.white,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                      onPressed: () {
                        flutterWebViewPlugin.reloadUrl(url + '/myaccount');
                      },
                    ),
                    FlatButton(
                      child: IntrinsicHeight(
                          child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.comment,
                            color: Colors.white,
                          ),
                          Text(
                            'Blog',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                      onPressed: () {
                        flutterWebViewPlugin.reloadUrl(url + '/blog');
                      },
                    ),
                  ],
                )),
              ),
            )),
            theme: this.themeData,
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: this.title,
            home: SafeArea(
              child: WebviewScaffold(
                hidden: true,
                bottomNavigationBar: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Color(0xFF02BB9F)),
                  child: BottomNavigationBar(items: [
                    BottomNavigationBarItem(
                      icon: new Icon(Icons.home),
                      title: new Text('Home'),
                    ),
                    BottomNavigationBarItem(
                      icon: new Icon(Icons.person),
                      title: new Text('Signup/Login'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), title: Text('Dashboard')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.insert_comment), title: Text('Blog'))
                  ]),
                ),
                url: this.url,
                withJavascript: true,
                withLocalStorage: true,
                withZoom: false,
                allowFileURLs: true,
                appCacheEnabled: true,
              ),
            ));
  }
}
