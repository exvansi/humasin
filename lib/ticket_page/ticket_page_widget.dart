import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'My Ticket',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'DM Sans',
            color: Colors.white,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelColor: FlutterFlowTheme.primaryColor,
                indicatorColor: FlutterFlowTheme.secondaryColor,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.palette,
                      color: FlutterFlowTheme.secondaryColor,
                      size: 25,
                    ),
                  ),
                  Tab(
                    icon: FaIcon(
                      FontAwesomeIcons.bullhorn,
                      color: FlutterFlowTheme.secondaryColor,
                      size: 25,
                    ),
                  ),
                  Tab(
                    icon: FaIcon(
                      FontAwesomeIcons.camera,
                      color: FlutterFlowTheme.secondaryColor,
                      size: 25,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.print_rounded,
                      color: FlutterFlowTheme.secondaryColor,
                      size: 25,
                    ),
                  ),
                  Tab(
                    icon: FaIcon(
                      FontAwesomeIcons.photoVideo,
                      color: FlutterFlowTheme.secondaryColor,
                      size: 25,
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Status Layanan Desain',
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ),
                        Expanded(
                          child: StreamBuilder<List<DesainRecord>>(
                            stream: queryDesainRecord(
                              queryBuilder: (desainRecord) =>
                                  desainRecord.where('user',
                                      isEqualTo: currentUserReference),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<DesainRecord> listViewDesainRecordList =
                                  snapshot.data;
                              // Customize what your widget looks like with no query results.
                              if (snapshot.data.isEmpty) {
                                // return Container();
                                // For now, we'll just include some dummy data.
                                listViewDesainRecordList =
                                    createDummyDesainRecord(count: 4);
                              }
                              return Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewDesainRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewDesainRecord =
                                        listViewDesainRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF5F5F5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 5, 5, 5),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listViewDesainRecord
                                                          .judulDesain,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            Color(0xFF16107D),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                          'yMMMd',
                                                          listViewDesainRecord
                                                              .deadlineDesain),
                                                      style: FlutterFlowTheme
                                                          .subtitle1
                                                          .override(
                                                        fontFamily: 'DM Sans',
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 10, 5),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Status',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'DM Sans',
                                                    ),
                                                  ),
                                                  Text(
                                                    listViewDesainRecord.status,
                                                    style: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'DM Sans',
                                                      color: Color(0xFF03A9F4),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Status Layanan Promosi',
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ),
                        Expanded(
                          child: StreamBuilder<List<PromosiRecord>>(
                            stream: queryPromosiRecord(
                              queryBuilder: (promosiRecord) =>
                                  promosiRecord.where('user',
                                      isEqualTo: currentUserReference),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<PromosiRecord> listViewPromosiRecordList =
                                  snapshot.data;
                              // Customize what your widget looks like with no query results.
                              if (snapshot.data.isEmpty) {
                                // return Container();
                                // For now, we'll just include some dummy data.
                                listViewPromosiRecordList =
                                    createDummyPromosiRecord(count: 4);
                              }
                              return Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewPromosiRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewPromosiRecord =
                                        listViewPromosiRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF5F5F5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 5, 5, 5),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listViewPromosiRecord
                                                          .judulPromosi,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            Color(0xFF16107D),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                          'yMMMd',
                                                          listViewPromosiRecord
                                                              .waktuTayangPromosi),
                                                      style: FlutterFlowTheme
                                                          .subtitle1
                                                          .override(
                                                        fontFamily: 'DM Sans',
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 10, 5),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Status',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'DM Sans',
                                                    ),
                                                  ),
                                                  Text(
                                                    listViewPromosiRecord
                                                        .status,
                                                    style: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'DM Sans',
                                                      color: Color(0xFF03A9F4),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Tab View 3',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'DM Sans',
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Tab View 4',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'DM Sans',
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Tab View 5',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'DM Sans',
                        fontSize: 32,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
