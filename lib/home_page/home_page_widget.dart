import '../add_cetak_page/add_cetak_page_widget.dart';
import '../add_desain_page/add_desain_page_widget.dart';
import '../add_kunjungan_page/add_kunjungan_page_widget.dart';
import '../add_peliputan_page/add_peliputan_page_widget.dart';
import '../add_promosi_page/add_promosi_page_widget.dart';
import '../add_studio_page/add_studio_page_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg1.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment(1, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 40, 10, 0),
                              child: IconButton(
                                onPressed: () async {
                                  await signOut();
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPageWidget(),
                                    ),
                                    (r) => false,
                                  );
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                iconSize: 25,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: AutoSizeText(
                              'Layanan Humas Internal',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.title1.override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.tertiaryColor,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            'Politeknik Siber dan Sandi Negara',
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Rubik',
                              color: Color(0xFF9AB6DE),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            'Selamat Datang,',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'DM Sans',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord
                            .where('email', isEqualTo: currentUserEmail),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        List<UsersRecord> rowUsersRecordList = snapshot.data;
                        // Customize what your widget looks like with no query results.
                        if (snapshot.data.isEmpty) {
                          // return Container();
                          // For now, we'll just include some dummy data.
                          rowUsersRecordList = createDummyUsersRecord(count: 1);
                        }
                        final rowUsersRecord = rowUsersRecordList.first;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                rowUsersRecord.displayName,
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF00BCD4),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    rowUsersRecord.photoUrl,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.tertiaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Align(
                      alignment: Alignment(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment(0, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 1,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddDesainPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  'assets/images/Layanan Desain.png',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Desain',
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'DM Sans',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddPromosiPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  'assets/images/Layanan Promosi.png',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Promosi',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'DM Sans',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddPeliputanPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  'assets/images/Layanan Peliputan dan Dokumentasi.png',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Peliputan dan Dokumentasi',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'DM Sans',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 20, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddCetakPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  'assets/images/Layanan Publikasi dan Percetakan.png',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Percetakan',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'DM Sans',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 20, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddStudioPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  'assets/images/Layanan Pemanfaatan Ruang Studio.png',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Text(
                                            'Pemanfaatan Ruang Studio',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'DM Sans',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 20, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddKunjunganPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  'assets/images/Layanan Penerimaan Kunjungan.png',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Penerimaan Kunjungan',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'DM Sans',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFF5F5F5),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 10, 10),
                                                child: Container(
                                                  width: 75,
                                                  height: 75,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://picsum.photos/seed/331/600',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment(0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.star_rate,
                                                        color:
                                                            Color(0xFFFBD72E),
                                                        size: 24,
                                                      ),
                                                      Icon(
                                                        Icons.star_rate,
                                                        color:
                                                            Color(0xFFFBD72E),
                                                        size: 24,
                                                      ),
                                                      Icon(
                                                        Icons.star_rate,
                                                        color:
                                                            Color(0xFFFBD72E),
                                                        size: 24,
                                                      ),
                                                      Icon(
                                                        Icons.star_rate,
                                                        color:
                                                            Color(0xFFFBD72E),
                                                        size: 24,
                                                      ),
                                                      Icon(
                                                        Icons.star_half,
                                                        color:
                                                            Color(0xFFFBD72E),
                                                        size: 24,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 5),
                                                  child: AutoSizeText(
                                                    'Trivan',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .title3
                                                        .override(
                                                      fontFamily: 'DM Sans',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Terima kasih tim Humas kerja cepat dan tuntas',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'DM Sans',
                                                    color: Color(0xFF3A3939),
                                                    fontSize: 10,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
