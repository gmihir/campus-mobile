import 'package:campus_mobile_experimental/core/constants/app_constants.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/debug/build_info.dart';

//import 'package:campus_mobile_experimental/ui/reusable_widgets/dots_indicator.dart';
import 'package:campus_mobile_experimental/ui/theme/app_theme.dart';
import 'package:campus_mobile_experimental/ui/views/onboarding/onboarding_affiliations.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_login.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final _controller = PageController();
  AnimationController _animationController;
  Animation<Offset> _offsetAnimation;
  double currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page.round() != currentIndex) {
        setState(() {
          currentIndex = _controller.page;
        });
      }
    });

    _animationController =
        AnimationController(duration: const Duration(seconds: 100), vsync: this)
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        Expanded(
            child: PageView(
          pageSnapping: true,
          controller: _controller,
          children: [
            ///PAGE 1 CONNECTIONS----------------------------------------------------
            Stack(children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height / 2 - 50,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                              'assets/images/onboarding_connections_background.png'),
                          fit: BoxFit.fill,
                        ))),
                    Expanded(
                        child: Container(
                      width: 350,
                      color: Colors.white,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            Text(
                              "Make the most out of your CAMPUS CONNECTIONS",
                              style: TextStyle(
                                  color: ColorPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            Text(
                              "your trusted, on-the-go, location-based campus resource for all things Triton.",
                              style: TextStyle(
                                  color: ColorPrimary.withOpacity(0.7),
                                  fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ])),
                    ))
                  ]),
              Container(
                padding: EdgeInsets.only(left: 15.0, top: 140.0),
                child: Container(
                    height: 290.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/app_preview.png'),
                      fit: BoxFit.fill,
                    ))),
              )
            ]),

            ///PAGE 2 NEWS---------------------------------------------------------
            LayoutBuilder(
              builder: (context, constraints) {
                final Size biggest = constraints.biggest;
                final double smallLogo = 200;
                final double bigLogo = 200;
                return (Stack(children: <Widget>[
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          Rect.fromLTWH(0, 0, smallLogo, smallLogo), biggest),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(biggest.width - bigLogo,
                              biggest.height - bigLogo, bigLogo, bigLogo),
                          biggest),
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.elasticInOut,
                    )),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlutterLogo()),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: MediaQuery.of(context).size.height / 2 - 50,
                            decoration: new BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/onboarding_affiliation_background.png'),
                              fit: BoxFit.fill,
                            ))),
                        Expanded(
                            child: Container(
                          width: 350,
                          color: Colors.white,
                          child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                Text(
                                  "Made for students AND staff",
                                  style: TextStyle(
                                      color: ColorPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                ),
                                Text(
                                  "Log in now to gain access to personalized information",
                                  style: TextStyle(
                                      color: ColorPrimary.withOpacity(0.7),
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ])),
                        ))
                      ]),
                  Column(children: <Widget>[
                    Container(
                      //alignment: Alignment.topRight,
                      padding: EdgeInsets.only(left: 10.0, top: 180.0),
                      child: Container(
                          height: 111.0,
                          width: 184.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image:
                                AssetImage('assets/images/student_profile.png'),
                            fit: BoxFit.fill,
                          ))),
                    ),
                    Container(
                      //alignment: Alignment.topRight,
                      padding: EdgeInsets.only(left: 10.0, top: 20.0),
                      child: Container(
                          height: 111.0,
                          width: 184.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image:
                                AssetImage('assets/images/student_profile.png'),
                            fit: BoxFit.fill,
                          ))),
                    )
                  ])
                ]));
              },
            ),

            ///PAGE 3 MAP----------------------------------------------------------
            Stack(children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height / 2 - 50,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding_social.png'),
                          fit: BoxFit.fill,
                        ))),
                    Expanded(
                        child: Container(
                      width: 350,
                      color: Colors.white,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            Text(
                              "Know what's going on",
                              style: TextStyle(
                                  color: ColorPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                            ),
                            Text(
                              "Connect to the latest university services, news, and information when you need it most",
                              style: TextStyle(
                                  color: ColorPrimary.withOpacity(0.7),
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ])),
                    ))
                  ]),
              Container(
                //alignment: Alignment.topCenter,
                padding: EdgeInsets.only(left: 180.0, top: 70.0),
                child: Container(
                    height: 363.0,
                    width: 167.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          'assets/images/onboarding_news_preview.png'),
                      fit: BoxFit.fill,
                    ))),
              )
            ]),
          ],
        )),
        DotsIndicator(
          dotsCount: 3,
          position: currentIndex,
          decorator: DotsDecorator(
              activeColor: ColorPrimary, spacing: EdgeInsets.all(4.0)),
        ),
        Container(
          height: 60,
          color: Colors.white,
        ),
        Container(
            color: ColorPrimary,
            height: 80,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: FlatButton(
                    color: ColorPrimary,
                    onPressed: () {
                      Navigator.of(context).push(_routeToAffiliations());
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          decoration: TextDecoration.underline),
                    ),
                  )),
                  Expanded(
                    child: FlatButton(
                      color: ColorPrimary,
                      onPressed: () {
                        Navigator.of(context).push(_routeToLogin());
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ]))
      ]),
    );

    /*
          Container(
            child: Row(children: <Widget>[
              Align(
                  alignment: Alignment.bottomLeft,
                  child: RaisedButton(
                    color: ColorPrimary,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutePaths.OnboardingAffiliations);
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          decoration: TextDecoration.underline),
                    ),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  color: ColorPrimary,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePaths.OnboardingLogin);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ]),
          )
          */
  }

  Route _routeToLogin() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          OnboardingLogin(),
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _routeToAffiliations() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          OnboardingAffiliations(),
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

/*Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/UCSanDiegoLogo-nav.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
                // SizedBox(height: 80),
                /*  Padding(
                    padding: const EdgeInsets.only(bottom: 26.0),
                    child: Text(
                      'Hello.',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),*/
                Text(
                  'Enter your login for a personalized experience.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    color: ColorPrimary,
                    onPressed: () {
                      Navigator.pushNamed(context, RoutePaths.OnboardingLogin);
                    },
                    child: Text(
                      "Let's do it.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    color: ColorPrimary,
                    onPressed: () async {
                      Navigator.pushNamedAndRemoveUntil(context,
                          RoutePaths.BottomNavigationBar, (_) => false);
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showOnboardingScreen', false);
                    },
                    child: Text(
                      "Skip for now.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
            flex: 2,
          ),
          //DebugBuildInfo(),
        ],
      ),
    );
  }
  */
