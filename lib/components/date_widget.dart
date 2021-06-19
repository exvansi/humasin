import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateWidget extends StatefulWidget {
  DateWidget({Key key}) : super(key: key);

  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'tanggal',
      style: FlutterFlowTheme.bodyText1.override(
        fontFamily: 'DM Sans',
      ),
    );
  }
}
