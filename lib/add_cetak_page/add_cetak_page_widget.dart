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

class AddCetakPageWidget extends StatefulWidget {
  AddCetakPageWidget({Key key}) : super(key: key);

  @override
  _AddCetakPageWidgetState createState() => _AddCetakPageWidgetState();
}

class _AddCetakPageWidgetState extends State<AddCetakPageWidget> {
  DateTime datePicked = DateTime.now();
  TextEditingController textController4;
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  String uploadedFileUrl = '';
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 =
        TextEditingController(text: dateTimeFormat('MMMMEEEEd', datePicked));
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
                  final judulCetak = textController1.text;
                  final mediaCetak = dropDownValue;
                  final jumlahCetak = int.parse(textController2.text);
                  final ukuranCetak = textController3.text;
                  final imageCetak = uploadedFileUrl;
                  final deadlineCetak = datePicked;
                  final kategori = 'Cetak';
                  final user = currentUserReference;
                  final status = 'Open';
                  final createdAt = getCurrentTimestamp;

                  final cetakRecordData = createCetakRecordData(
                    judulCetak: judulCetak,
                    mediaCetak: mediaCetak,
                    jumlahCetak: jumlahCetak,
                    ukuranCetak: ukuranCetak,
                    imageCetak: imageCetak,
                    deadlineCetak: deadlineCetak,
                    kategori: kategori,
                    user: user,
                    status: status,
                    createdAt: createdAt,
                  );

                  await CetakRecord.collection.doc().set(cetakRecordData);
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
                              'assets/images/Layanan Publikasi dan Percetakan.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              'Layanan Percetakan',
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
                                'Judul Substansi Percetakan Anda?',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: textController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Tuliskan judul substansi Anda disini...',
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
                                'Jenis media cetak apakah yang Anda inginkan?',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            StreamBuilder<List<JenisCetakRecord>>(
                              stream: queryJenisCetakRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                List<JenisCetakRecord>
                                    dropDownJenisCetakRecordList =
                                    snapshot.data;
                                // Customize what your widget looks like with no query results.
                                if (snapshot.data.isEmpty) {
                                  return Container(
                                    height: 100,
                                    child: Center(
                                      child: Text('No results.'),
                                    ),
                                  );
                                }
                                final dropDownJenisCetakRecord =
                                    dropDownJenisCetakRecordList.first;
                                return FlutterFlowDropDown(
                                  initialOption: dropDownValue,
                                  options:
                                      dropDownJenisCetakRecord.jenis.toList(),
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
                                'Jumlah Cetak',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: textController2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Tuliskan jumlah yang dicetak',
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
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Field is required';
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
                                'Ukuran Media',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: textController3,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Tuliskan ukuran media yang dicetak',
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
                                    return 'Field is required';
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
                                'Upload Image',
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
                                        () => uploadedFileUrl = downloadUrl);
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
                                'Tentukan maksimal target waktu penyelesaian.',
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
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: TextFormField(
                                      controller: textController4,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Tanggal dan Waktu',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'DM Sans',
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'DM Sans',
                                      ),
                                      keyboardType: TextInputType.datetime,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Field is required';
                                        }

                                        return null;
                                      },
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
