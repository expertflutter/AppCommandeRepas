import '../flutter_flow/flutter_flow_theme.dart';
import '../components/pagevue_widget.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with TickerProviderStateMixin {
  String size;
  double iprice = 1590;
  double price = 1590;
  double _padding = 70;
  double _height = 277;
  double _heighta = 290;
  final pageViewController = PageController();
  bool like = false;
  int currentPage = 0;
  List data = [
    {
      'text': 'THIEP ',
      'image': 'assets/images/thieb.png',
      'like': false
    },
    {
      'text': 'MAFFÉ',
      'image': 'assets/images/maffe.png',
      'like': false
    },
    {
      'text': 'Yassa ',
      'image': 'assets/images/yassa.png',
      'like': false
    },
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            print('IconButton pressed ...');
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 30,
          ),
          iconSize: 30,
        ),
        title: Text(
          'SENEGALAISE',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              onPressed: () {
                if (like) {
                  setState(() {
                    like = false;
                    data[currentPage]['like'] = like;
                  });
                } else {
                  setState(() {
                    like = true;
                    data[currentPage]['like'] = like;
                  });
                }
              },
              icon: (!like)
                  ? FaIcon(
                      FontAwesomeIcons.heart,
                      color: Colors.black,
                      size: 30,
                    )
                  : Icon(Icons.favorite, color: Colors.red, size: 30.0),
              iconSize: 30,
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.tertiaryColor,
          ),
          child: Container(
            width: 100,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.tertiaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 27),
                          child: AnimatedContainer(
                            duration: new Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width,
                            height: _heighta,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 43, 0, 0),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/Sans_titre__3_-removebg-preview.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, _padding, 0, 0),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(mainAxisSize: MainAxisSize.max, children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.6,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      width: double.infinity,
                                      height: MediaQuery.of(context).size.height * 1,
                                      child: PageView.builder(
                                        controller: pageViewController,
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (value) {
                                          setState(() {
                                            currentPage = value;
                                            getPrice(value);
                                          });
                                        },
                                        itemCount: data.length,
                                        itemBuilder: (context, index) => Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                data[index]['text'],
                                                style: FlutterFlowTheme.title2.override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PagevueWidget(image: data[index]['image'], size: size, iprice: iprice, price: price, name: data[index]['text'])));
                                                  ;
                                                },
                                                child: AnimatedContainer(
                                                  duration: new Duration(milliseconds: 300),
                                                  width: double.infinity,
                                                  height: _height,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 1, 0, 9),
                                                    child: Container(
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Hero(
                                                        tag: 'hero',
                                                        child: Image.asset(
                                                          data[index]['image'],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ])),
                          )),
                      Align(
                        alignment: Alignment(0, 1),
                        child: Text(
                          " $price FCFA ",
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Roboto Condensed',
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                setState(() {
                                  _padding = 70;
                                  _height = 277;
                                  _heighta = 290;
                                  price = iprice;
                                  size = "S";
                                });
                              },
                              text: 'S',
                              options: FFButtonOptions(
                                width: 130,
                                height: 25,
                                color: FlutterFlowTheme.tertiaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 36,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                setState(() {
                                  _height = 292;
                                  _heighta = 330;
                                  _padding = 63;
                                  price = iprice + 250;
                                  size = "M";
                                });
                              },
                              text: 'M',
                              options: FFButtonOptions(
                                width: 130,
                                height: 25,
                                color: FlutterFlowTheme.tertiaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 36,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                setState(() {
                                  _height = 323;
                                  _heighta = 370;
                                  _padding = 49;
                                  price = iprice + 500;
                                  size = "L";
                                });
                              },
                              text: 'L',
                              options: FFButtonOptions(
                                width: 130,
                                height: 25,
                                color: FlutterFlowTheme.tertiaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 36,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.tertiaryColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                    ),
                    child: FFButtonWidget(
                      onPressed: () {},
                      text: 'Acheter',
                      icon: FaIcon(
                        FontAwesomeIcons.cartPlus,
                        color: FlutterFlowTheme.tertiaryColor,
                        size: 25,
                      ),
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Colors.black,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                        elevation: 4,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getPrice(currentPage) {
    if (currentPage == 0) {
      setState(() {
        _padding = 70;
        _height = 277;
        _heighta = 290;
        price = 1590;
        iprice = price;
        like = data[0]['like'];
      });
    } else if (currentPage == 1) {
      setState(() {
        _padding = 70;
        _height = 277;
        _heighta = 290;
        price = 998.2;
        iprice = price;
        like = data[1]['like'];
      });
    } else {
      setState(() {
        _padding = 70;
        _height = 277;
        _heighta = 290;
        price = 2198.2;
        iprice = price;
        like = data[2]['like'];
      });
    }
  }
}
