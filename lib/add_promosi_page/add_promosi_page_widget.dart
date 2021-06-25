import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPromosiPageWidget extends StatefulWidget {
  AddPromosiPageWidget({Key key}) : super(key: key);

  @override
  _AddPromosiPageWidgetState createState() => _AddPromosiPageWidgetState();
}

class _AddPromosiPageWidgetState extends State<AddPromosiPageWidget> {
  DateTime datePicked = DateTime.now();
  String dropDownValue;
  TextEditingController textController;
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.primaryColor,
          automaticallyImplyLeading: true,
          title: Text(
            'Tambah Layanan',
            style: FlutterFlowTheme.title3.override(
              fontFamily: 'DM Sans',
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: IconButton(
                onPressed: () async {
                  if (!formKey.currentState.validate()) {
                    return;
                  }
                  final judulPromosi = textController.text;
                  final mediaPromosi = dropDownValue;
                  final waktuTayangPromosi = datePicked;
                  final imagePromosi = uploadedFileUrl1;
                  final videoPromosi = uploadedFileUrl2;
                  final kategori = 'Promosi';
                  final user = currentUserReference;
                  final status = 'Open';

                  final promosiRecordData = createPromosiRecordData(
                    judulPromosi: judulPromosi,
                    mediaPromosi: mediaPromosi,
                    waktuTayangPromosi: waktuTayangPromosi,
                    imagePromosi: imagePromosi,
                    videoPromosi: videoPromosi,
                    kategori: kategori,
                    user: user,
                    status: status,
                  );

                  await PromosiRecord.collection.doc().set(promosiRecordData);
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                iconSize: 25,
              ),
            )
          ],
          centerTitle: true,
          elevation: 4,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Image.asset(
                              'assets/images/Layanan Promosi.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              'Layanan Promosi',
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'DM Sans',
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                'Judul Promosi Anda?',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Tuliskan judul promosi Anda disini...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'DM Sans',
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x6BFFFFFF),
                                ),
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'DM Sans',
                                ),
                                textAlign: TextAlign.justify,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Judul wajib diisi!';
                                  }
                                  if (val.length < 4) {
                                    return 'Requires at least 4 characters.';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                'Media promosi apa yang ingin Anda gunakan?',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            StreamBuilder<List<MediaPromosiRecord>>(
                              stream: queryMediaPromosiRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                List<MediaPromosiRecord>
                                    dropDownMediaPromosiRecordList =
                                    snapshot.data;
                                // Customize what your widget looks like with no query results.
                                if (snapshot.data.isEmpty) {
                                  // return Container();
                                  // For now, we'll just include some dummy data.
                                  dropDownMediaPromosiRecordList =
                                      createDummyMediaPromosiRecord(count: 1);
                                }
                                final dropDownMediaPromosiRecord =
                                    dropDownMediaPromosiRecordList.first;
                                return FlutterFlowDropDown(
                                  initialOption: dropDownValue,
                                  options:
                                      dropDownMediaPromosiRecord.media.toList(),
                                  onChanged: (value) {
                                    setState(() => dropDownValue = value);
                                  },
                                  width: double.infinity,
                                  height: 40,
                                  textStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'DM Sans',
                                  ),
                                  fillColor: Colors.white,
                                  elevation: 2,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0,
                                  borderRadius: 0,
                                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                );
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                'Upload Image jika ada',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final selectedMedia = await selectMedia();
                                if (selectedMedia != null &&
                                    validateFileFormat(
                                        selectedMedia.storagePath, context)) {
                                  showUploadMessage(
                                      context, 'Uploading file...',
                                      showLoading: true);
                                  final downloadUrl = await uploadData(
                                      selectedMedia.storagePath,
                                      selectedMedia.bytes);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  if (downloadUrl != null) {
                                    setState(
                                        () => uploadedFileUrl1 = downloadUrl);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                  }
                                }
                              },
                              child: Image.asset(
                                'assets/images/Upload.jpeg',
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                'Upload Video jika ada',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final selectedMedia = await selectMedia(
                                  isVideo: true,
                                );
                                if (selectedMedia != null &&
                                    validateFileFormat(
                                        selectedMedia.storagePath, context)) {
                                  showUploadMessage(
                                      context, 'Uploading file...',
                                      showLoading: true);
                                  final downloadUrl = await uploadData(
                                      selectedMedia.storagePath,
                                      selectedMedia.bytes);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  if (downloadUrl != null) {
                                    setState(
                                        () => uploadedFileUrl2 = downloadUrl);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                  }
                                }
                              },
                              child: Image.asset(
                                'assets/images/Upload.jpeg',
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                'Kapan waktu tayang yang Anda inginkan?',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                      setState(() => datePicked = date);
                                    }, currentTime: DateTime.now());
                                  },
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: FlutterFlowTheme.secondaryColor,
                                    size: 24,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Text(
                                    dateTimeFormat('MMMMEEEEd', datePicked),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'DM Sans',
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
