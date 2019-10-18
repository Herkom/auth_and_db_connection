
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingPage extends StatefulWidget{
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>{

  final PageController _pageController = PageController(initialPage: 0);
  Color _colorDelTexto = Colors.transparent;


  final int _numPages = 3;
  int _currentPage = 0;

  List<Widget> _buildPageIndicator(){
    List<Widget> list = [];
    for(int i = 0; i < _numPages; i++){
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }


  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple : Colors.deepPurpleAccent.withAlpha(100),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Saltar',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 20.0,
                        ),
                      )
                  ),
                ),
                Container(
                  height: 480.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    onPageChanged: (int page){
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    controller: _pageController,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom:20.0, left:40.0, right:40.0,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                                child: Image(
                                  image: AssetImage(
                                      'assets/img/onboarding_1.png'
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                )
                            ),
                            Text(
                                'Onboarding Slide Title',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            SizedBox(height: 15.0),
                            AnimatedContainer(
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 2),
                              child: Text(
                                  "This is a short explanation about what is the app's pourpuse",
                                  style: TextStyle(
                                    color: _colorDelTexto,
                                    fontSize: 20.0,
                                  )
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom:20.0, left:40.0, right:40.0,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                                child: Image(
                                  image: AssetImage(
                                      'assets/img/onboarding_2.png'
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                )
                            ),
                            Text(
                                'Onboarding Slide Title',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            SizedBox(height: 15.0),
                            AnimatedContainer(
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 2),
                              child: Text(
                                  "This is a short explanation about what is the app's pourpuse",
                                  style: TextStyle(
                                    color: _colorDelTexto,
                                    fontSize: 20.0,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom:20.0, left:40.0, right:40.0,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                                child: Image(
                                  image: AssetImage(
                                      'assets/img/onboarding_3.png'
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                )
                            ),
                            Text(
                                'Onboarding Slide Title',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            SizedBox(height: 15.0),
                            AnimatedContainer(
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 2),
                              child: Text(
                                  "This is a short explanation about what is the app's pourpuse",
                                  style: TextStyle(
                                    color: _colorDelTexto,
                                    fontSize: 20.0,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                ),


                _currentPage != _numPages - 1 ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                          onPressed: (){
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(width: 10.0,),
                              Icon(
                                  Icons.arrow_forward,
                                  color: Colors.deepPurple,
                                  size: 30.0,
                              )
                            ],
                          )
                      ),
                    )
                )
                    : Text(''),
              ],
            ),
          )
        )
      ,
      bottomSheet: _currentPage == _numPages - 1
        ? Container(
          height: 80.0,
          width: double.infinity,
          color: Colors.deepPurple,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/login');
            },
            child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Vamos allá',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
          )
      ) : Text(''),
    );
  }
}
