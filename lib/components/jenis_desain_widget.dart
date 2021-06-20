import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class JenisDesainWidget extends StatefulWidget {
  JenisDesainWidget({Key key}) : super(key: key);

  @override
  _JenisDesainWidgetState createState() => _JenisDesainWidgetState();
}

class _JenisDesainWidgetState extends State<JenisDesainWidget> {
  String radioButtonValue;

  @override
  Widget build(BuildContext context) {
    return FlutterFlowRadioButton(
      options: ['Desain Grafis', 'Desain Videografis', 'Kombinasi keduanya'],
      onChanged: (value) {
        setState(() => radioButtonValue = value);
      },
      optionHeight: 25,
      textStyle: FlutterFlowTheme.bodyText2.override(
        fontFamily: 'DM Sans',
      ),
      buttonPosition: RadioButtonPosition.left,
      direction: Axis.vertical,
      radioButtonColor: FlutterFlowTheme.secondaryColor,
      toggleable: false,
      horizontalAlignment: WrapAlignment.start,
      verticalAlignment: WrapCrossAlignment.start,
    );
  }
}
