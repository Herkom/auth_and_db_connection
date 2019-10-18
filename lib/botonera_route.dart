import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'gradient_back.dart';
import 'package:url_launcher/url_launcher.dart';

class BotoneraRoute extends StatelessWidget {

  double screenHeight;
  double screenWidth;
  int number;
  List<String> url;
  List<String> urls;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    url = [
      'http://www.osfetabasco.gob.mx:8080',
      'http://www.osfetabasco.gob.mx:8080',
      'http://201.99.126.42/denuncias',
      'http://200.56.118.29/sac',
    ];
    urls = [
      'http://200.56.118.29/sedeca',
      'http://200.56.118.29/corre',
      'http://201.99.126.42/Apps/Inicio',
      'http://www.osfetabasco.gob.mx/siteapp/bolsatrabajo/'
    ];

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

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack( screenHeight ),
          SingleChildScrollView(
            child: Column(
              children: [


                // --------------- TITULARES -----------------------
                Container(
                  padding: EdgeInsets.only( bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
                        child: Image(
                          width: screenWidth*0.4,
                          image: AssetImage('assets/img/OSFElogo.png'),
                        ),
                      ),
                      Text(
                        'Plataforma Tecnológica',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                // --------------- TITULARES -----------------------


                // --------------- BTN CUENTA PUBLICA -----------------------
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Card(
                    color: Colors.white.withAlpha(190),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: InkWell(
                      onTap: (){_launchURL('http://www.osfetabasco.gob.mx/Objetos/documentos/IR/InfRes.html');},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical:40.0, horizontal: 30),
                        child: Image(
                          width: screenWidth*0.65,
                          image: AssetImage('assets/img/cuentaPublica.png'),
                        ),
                      ),
                    ) ,
                  ),
                ),
                // --------------- BTN CUENTA PUBLICA -----------------------


                // --------------- SERVICIOS PUBLICOS -----------------------
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        number = index + 1;
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                            margin: EdgeInsets.only(bottom: 20.0),
                          child: InkWell(
                            onTap: (){_launchURL(url[index]);},
                            child: Card(
                              color: Colors.white,
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Image(
                                  width: screenWidth*0.4,
                                  image: AssetImage('assets/img/btn_$number.png'),
                                ),
                              ),
                            ),
                          )
                        );
                      },
                    ),
                  ),
                ),

                // --------------- SERVICIOS PUBLICOS -----------------------


                // --------------- SERVICIOS INTERNOS -----------------------
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        number = 4 + index + 1;
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: InkWell(
                            onTap: (){ _launchURL(urls[index]); },
                            child: Card(
                                color: Colors.white,
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Image(
                                    width: screenWidth*0.4,
                                    image: AssetImage('assets/img/btn_$number.png'),
                                  ),
                                ),
                              ),
                          )
                        );
                      },
                    ),
                  ),
                ),

                // --------------- SERVICIOS INTERNOS -----------------------
              ]
            ),
          )
        ],
      )
    );
  }
}
/*
SingleChildScrollView(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text(
        'Headline',
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(
        height: 200.0,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) => Card(
            child: Center(child: Text('Dummy Card Text')),
          ),
        ),
      ),
    ],
  ),
),
*/


/*
ListView(
  padding: EdgeInsets.symmetric(vertical:25.0),
  scrollDirection: Axis.vertical,
  children: <Widget>[
    Container(
      child: Card(
        color: Colors.white.withAlpha(180),
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(50),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Image(
            image: AssetImage('assets/img/cuentaPublica.png'),
            ),
          ),
        ),
      ),
    ),
    Container(
    child: Card(
    color: Colors.white.withAlpha(180),
    elevation: 20.0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0)
    ),
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
    child: InkWell(
    splashColor: Colors.blue.withAlpha(50),
    onTap: () {
    print('Card tapped.');
    },
    child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    child: Image(
    image: AssetImage('assets/img/cuentaPublica.png'),
    ),
    ),
    ),
    ),
    ),
    Container(
    child: Card(
    color: Colors.white.withAlpha(180),
    elevation: 20.0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0)
    ),
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
    child: InkWell(
    splashColor: Colors.blue.withAlpha(50),
    onTap: () {
    print('Card tapped.');
    },
    child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    child: Image(
    image: AssetImage('assets/img/btn_1.png'),
    ),
    ),
    ),
    ),
    ),
  ],
),

*/
