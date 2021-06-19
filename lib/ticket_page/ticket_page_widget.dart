import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketPageWidget extends StatefulWidget {
  TicketPageWidget({Key key}) : super(key: key);

  @override
  _TicketPageWidgetState createState() => _TicketPageWidgetState();
}

class _TicketPageWidgetState extends State<TicketPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Image.asset(
              'assets/images/bg1.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'HomePage'),
                                  ),
                                  (r) => false,
                                );
                              },
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                              iconSize: 25,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  'Status Tiket Anda',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.asset(
                                                'assets/images/Layanan Desain.png',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tiket 1',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.title3
                                                  .override(
                                                fontFamily: 'DM Sans',
                                              ),
                                            ),
                                            Text(
                                              'Desain',
                                              style: FlutterFlowTheme.subtitle2
                                                  .override(
                                                fontFamily: 'DM Sans',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Open',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFFC30707),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.asset(
                                                'assets/images/Layanan Promosi.png',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tiket 2',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.title3
                                                  .override(
                                                fontFamily: 'DM Sans',
                                              ),
                                            ),
                                            Text(
                                              'Promosi',
                                              style: FlutterFlowTheme.subtitle2
                                                  .override(
                                                fontFamily: 'DM Sans',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'On Progress',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFFFBD72E),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.asset(
                                                'assets/images/Layanan Pemanfaatan Ruang Studio.png',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tiket 3',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.title3
                                                  .override(
                                                fontFamily: 'DM Sans',
                                              ),
                                            ),
                                            Text(
                                              'Studio',
                                              style: FlutterFlowTheme.subtitle2
                                                  .override(
                                                fontFamily: 'DM Sans',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Done',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF07C383),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.asset(
                                                'assets/images/Layanan Peliputan dan Dokumentasi.png',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tiket 4',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.title3
                                                  .override(
                                                fontFamily: 'DM Sans',
                                              ),
                                            ),
                                            Text(
                                              'Peliputan',
                                              style: FlutterFlowTheme.subtitle2
                                                  .override(
                                                fontFamily: 'DM Sans',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Open',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFFC30707),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
