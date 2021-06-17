import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPageWidget extends StatefulWidget {
  AccountPageWidget({Key key}) : super(key: key);

  @override
  _AccountPageWidgetState createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.primaryColor,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          print('IconButton pressed ...');
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/276/600',
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(34, 36, 0, 0),
                            child: Icon(
                              Icons.add_circle,
                              color: Color(0x9EFFFFFF),
                              size: 50,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Profil User',
                        style: FlutterFlowTheme.title2.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.tertiaryColor,
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
                shape: BoxShape.rectangle,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.secondaryColor,
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    'Trivan',
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'DM Sans',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: FlutterFlowTheme.secondaryColor,
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    'raden.trivan@poltekssn.ac.id',
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'DM Sans',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.work,
                                  color: FlutterFlowTheme.secondaryColor,
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    'Kasubbag Jashumas',
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'DM Sans',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: FlutterFlowTheme.secondaryColor,
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    '081311157159',
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'DM Sans',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Log Out',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.secondaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'DM Sans',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
