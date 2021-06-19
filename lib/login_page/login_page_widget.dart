import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../sign_up_page/sign_up_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final pageViewController = PageController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: Alignment(0, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageViewController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Align(
                            alignment: Alignment(0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                'assets/images/Logo.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Image.asset(
                                  'assets/images/Layanan Desain.png',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.7),
                                child: Text(
                                  'Layanan Desain',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.title2.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Image.asset(
                                  'assets/images/Layanan Promosi.png',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.7),
                                child: Text(
                                  'Layanan Promosi',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.title2.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Image.asset(
                                  'assets/images/Layanan Peliputan dan Dokumentasi.png',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.7),
                                child: Text(
                                  'Layanan Peliputan dan Dokumentasi',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.title2.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Image.asset(
                                  'assets/images/Layanan Pemanfaatan Ruang Studio.png',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.7),
                                child: Text(
                                  'Layanan Pemanfaatan\\nRuang Studio',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.title2.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Image.asset(
                                  'assets/images/Layanan Publikasi dan Percetakan.png',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.7),
                                child: Text(
                                  'Layanan Publikasi\\ndan Percetakan',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.title2.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Image.asset(
                                  'assets/images/Layanan Penerimaan Kunjungan.png',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.7),
                                child: Text(
                                  'Layanan Penerimaan\\nKunjungan',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.title2.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment(0, 1),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: SmoothPageIndicator(
                            controller: pageViewController,
                            count: 7,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 8,
                              dotHeight: 8,
                              dotColor: Color(0xFF9AB6DE),
                              activeDotColor: Colors.white,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        'Log In',
                        style: FlutterFlowTheme.title2.override(
                          fontFamily: 'DM Sans',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child: TextFormField(
                          onChanged: (_) => setState(() {}),
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'DM Sans',
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF16107D),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF16107D),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Color(0xFF6967EC),
                            ),
                            suffixIcon: emailController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => emailController.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'DM Sans',
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Field is required';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'DM Sans',
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF16107D),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF16107D),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFF6967EC),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'DM Sans',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (!formKey.currentState.validate()) {
                                  return;
                                }
                                final user = await signInWithEmail(
                                  context,
                                  emailController.text,
                                  passwordController.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'HomePage'),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Masuk',
                              options: FFButtonOptions(
                                width: 120,
                                height: 40,
                                color: FlutterFlowTheme.secondaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'DM Sans',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun?',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'DM Sans',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 5),
                                    reverseDuration: Duration(milliseconds: 5),
                                    child: SignUpPageWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                'Daftar disini',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
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
            )
          ],
        ),
      ),
    );
  }
}
