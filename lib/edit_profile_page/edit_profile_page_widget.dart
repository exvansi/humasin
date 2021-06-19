import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePageWidget extends StatefulWidget {
  EditProfilePageWidget({Key key}) : super(key: key);

  @override
  _EditProfilePageWidgetState createState() => _EditProfilePageWidgetState();
}

class _EditProfilePageWidgetState extends State<EditProfilePageWidget> {
  String uploadedFileUrl = '';
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<UsersRecord> editProfilePageUsersRecordList = snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          editProfilePageUsersRecordList = createDummyUsersRecord(count: 1);
        }
        final editProfilePageUsersRecord = editProfilePageUsersRecordList.first;
        return Scaffold(
          key: scaffoldKey,
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
                            onPressed: () async {
                              Navigator.pop(context);
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
                        Align(
                          alignment: Alignment(0, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final selectedMedia = await selectMedia();
                                    if (selectedMedia != null &&
                                        validateFileFormat(
                                            selectedMedia.storagePath,
                                            context)) {
                                      showUploadMessage(
                                          context, 'Uploading file...',
                                          showLoading: true);
                                      final downloadUrl = await uploadData(
                                          selectedMedia.storagePath,
                                          selectedMedia.bytes);
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      if (downloadUrl != null) {
                                        setState(() =>
                                            uploadedFileUrl = downloadUrl);
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        showUploadMessage(
                                            context, 'Failed to upload media');
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      editProfilePageUsersRecord.photoUrl,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0, 0.1),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Color(0x6BFFFFFF),
                                    size: 40,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                            'Edit Profil',
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
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        child: TextFormField(
                                          controller: textController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Nama',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'DM Sans',
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'DM Sans',
                                          ),
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
                                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        editProfilePageUsersRecord.email,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
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
                                onPressed: () async {
                                  final displayName = textController.text;
                                  final photoUrl = uploadedFileUrl;

                                  final usersRecordData = createUsersRecordData(
                                    displayName: displayName,
                                    photoUrl: photoUrl,
                                  );

                                  await currentUserReference
                                      .update(usersRecordData);
                                  Navigator.pop(context);
                                },
                                text: 'Save',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.secondaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
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
      },
    );
  }
}
