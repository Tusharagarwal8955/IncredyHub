import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IncredyHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'IncredyHub'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _webViewController;

  void _incrementCounter() {
    setState(() {
      _webViewController.loadUrl("https://incredyhub.com/");
    });
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/playstore.png',
              width: 60,
            ),
            Text(
              widget.title,
              style: GoogleFonts.indieFlower(
                  textStyle: TextStyle(color: Colors.yellow, fontSize: 35)),
            ),
          ],
        ),
      ),
      body: WebView(
        initialUrl: 'https://incredyhub.com/',
        javaScriptMode: JavaScriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _launchURL(
                        'https://www.youtube.com/channel/UCK9nijxSuDj-63sirxLDamw');
                  },
                  tooltip: 'Go to My Youtube channel',
                  backgroundColor: Colors.red,
                  child: Icon(FontAwesomeIcons.youtube),
                ),
                SizedBox(
                  height: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    _launchURL('https://www.facebook.com/IncredyHub');
                  },
                  tooltip: 'Go to Google',
                  backgroundColor: Colors.blueAccent.shade700,
                  child: Icon(FontAwesomeIcons.facebook),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _launchURL('https://www.instagram.com/incredy_hub/');
                  },
                  tooltip: 'Go to Google',
                  backgroundColor: Colors.pinkAccent,
                  child: Icon(FontAwesomeIcons.instagram),
                ),
                SizedBox(
                  height: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    _launchURL('https://twitter.com/IncredyHub');
                  },
                  tooltip: 'Go to Google',
                  backgroundColor: Colors.blueAccent.shade700,
                  child: Icon(FontAwesomeIcons.twitter),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
