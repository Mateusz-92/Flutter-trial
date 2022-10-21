import 'dart:ui';
import 'dart:convert';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

//import 'package:myapp/auth/auth_state.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:intl/intl.dart' hide TextDirection;
import 'package:collection/collection.dart';
//import 'package:myapp/src/pages/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map/map.dart' hide Map;
import 'package:latlng/latlng.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:http/http.dart' as http;
//import 'package:teta_cms/teta_cms.dart';

class ReoHome extends StatefulWidget {
  const ReoHome({
    Key? key,
  }) : super(key: key);

  @override
  _StateHome createState() => _StateHome();
}

class _StateHome extends State<ReoHome> {
  var datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: double.maxFinite,
          height: 70,
          decoration: const BoxDecoration(
            color: Color(0xFFFF7786),
            border: Border(
              left: BorderSide(
                  width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
              top: BorderSide(
                  width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
              right: BorderSide(
                  width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
              bottom: BorderSide(
                  width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 35,
                ),
                child: BouncingWidget(
                  onPressed: () async {
                    await Future<void>.delayed(Duration(milliseconds: 3));
                    // await Navigator.push<void>(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PageSettings(),
                    //   ),
                    // );
                  },
                  duration: const Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  child: Icon(
                    MdiIcons.fromString('dots-horizontal'),
                    size: 38,
                    color: Color(0xFFFCFCFC),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 64,
            ),
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            height: 450,
            decoration: BoxDecoration(
              color: const Color(0xFFFF7786),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              border: Border(
                left: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                top: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                right: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                bottom: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
              ),
            ),
            child: SafeArea(
              left: false,
              top: false,
              right: false,
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 74,
                            bottom: 35,
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: BouncingWidget(
                                  onPressed: () async {
                                    await Future<void>.delayed(
                                        Duration(milliseconds: 3));
                                    // await Navigator.push<void>(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         PageNewCardBoxname(),
                                    //   ),
                                    // );
                                  },
                                  duration: const Duration(milliseconds: 100),
                                  scaleFactor: 6,
                                  child: Container(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(200),
                                        topRight: Radius.circular(200),
                                        bottomRight: Radius.circular(200),
                                        bottomLeft: Radius.circular(200),
                                      ),
                                      border: Border(
                                        left: BorderSide(
                                            width: 1, color: Color(0xFFFFFFFF)),
                                        top: BorderSide(
                                            width: 1, color: Color(0xFFFFFFFF)),
                                        right: BorderSide(
                                            width: 1, color: Color(0xFFFFFFFF)),
                                        bottom: BorderSide(
                                            width: 1, color: Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                    child: Icon(
                                      MdiIcons.fromString('plus'),
                                      size: 100,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 2,
                                ),
                                child: Text(r'''biology''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 16,
                                  bottom: 15,
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 2,
                                            ),
                                            child: Text(r'''maths''',
                                                style: GoogleFonts.firaSans(
                                                  textStyle: TextStyle(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 34,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.center,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 6,
                                                    bottom: 8,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await Future<
                                                              void>.delayed(
                                                          Duration(
                                                              milliseconds: 1));
                                                      // await Navigator.push<
                                                      //     void>(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      //     builder: (context) =>
                                                      //         PageDelete(),
                                                      //   ),
                                                      // );
                                                    },
                                                    onDoubleTap: () async {},
                                                    onLongPress: () async {},
                                                    child: Text(r'''Lesson 3''',
                                                        style: GoogleFonts
                                                            .firaSans(
                                                          textStyle: TextStyle(
                                                            color: const Color(
                                                                0xFFFFFFFF),
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 18,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 1),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8,
                                                    bottom: 6,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await Future<
                                                              void>.delayed(
                                                          Duration(
                                                              milliseconds: 1));
                                                      // await Navigator.push<
                                                      //     void>(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      //     builder: (context) =>
                                                      //         PageShare(),
                                                      //   ),
                                                      // );
                                                    },
                                                    onDoubleTap: () async {},
                                                    onLongPress: () async {},
                                                    child: Text(r'''Lesson 2''',
                                                        style: GoogleFonts
                                                            .firaSans(
                                                          textStyle: TextStyle(
                                                            color: const Color(
                                                                0xFFFFFFFF),
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 18,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 1),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 6,
                                                    bottom: 6,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await Future<
                                                              void>.delayed(
                                                          Duration(
                                                              milliseconds: 1));
                                                      // await Navigator.push<
                                                      //     void>(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      //     builder: (context) =>
                                                      //         PageCard(),
                                                      //   ),
                                                      // );
                                                    },
                                                    onDoubleTap: () async {},
                                                    onLongPress: () async {},
                                                    child: Text(r'''Lesson 1''',
                                                        style: GoogleFonts
                                                            .firaSans(
                                                          textStyle: TextStyle(
                                                            color: const Color(
                                                                0xFFFFFFFF),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 1),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 2,
                                ),
                                child: Text(r'''biology''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''my English 3''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''my English 2''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''history''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''best book / cool''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''my English 1''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''my English ''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''history 1939''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''Spanish 4''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 2,
                                ),
                                child: Text(r'''Spanish 3''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''Book "Only My"''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''French basics''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(r'''my English ''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 120,
                                ),
                                child: Text(r'''Maths ''',
                                    style: GoogleFonts.firaSans(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // BottomBar
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BouncingWidget(
                onPressed: () async {
                  await Future<void>.delayed(Duration(milliseconds: 3));
                  // await Navigator.push<void>(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PageMarketplaceHome(),
                  //   ),
                  // );
                },
                duration: const Duration(milliseconds: 100),
                scaleFactor: 1.5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 64,
                        bottom: 28,
                      ),
                      child: Icon(
                        MdiIcons.fromString('shopping'),
                        size: 24,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 4,
                      ),
                      child: Text(r'''See the best lesson for today''',
                          style: GoogleFonts.firaSans(
                            textStyle: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          maxLines: 1),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
