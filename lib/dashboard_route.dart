import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardRoute extends StatelessWidget {
  String url = 'https://app.powerbi.com/view?r=eyJrIjoiZTE3MGEyZmItNDc5Ni00MWYyLTg3N2MtNWIxYWNjNzlmMDQ3IiwidCI6IjA4MTYyZjMwLWI5YTYtNGE3MC04ZDhlLTllN2QyYjVjN2FhNCJ9&pageName=ReportSection';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed:(){ _launchURL(url);},
          child: Text('Show Flutter homepage'),
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}