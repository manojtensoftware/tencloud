import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../verifysms/verifysms_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginpageWidget extends StatefulWidget {
  LoginpageWidget({Key key}) : super(key: key);

  @override
  _LoginpageWidgetState createState() => _LoginpageWidgetState();
}

class _LoginpageWidgetState extends State<LoginpageWidget> {
  TextEditingController textController;
  bool _loadingButton = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '+91');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                  child: Image.asset(
                    'assets/images/TEN_SOFTWARE_LOGO_JPG_(1).jpg',
                    width: 400,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Image.asset(
                  'assets/images/man_(1).png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFFBC02D),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/yellow_grunge_style_halftone_pattern_background.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xFF080101),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Login by Mobile No',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xE6000000),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 30, 5, 0),
                            child: TextFormField(
                              onChanged: (_) => setState(() {}),
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: '[Some hint text...]',
                                hintStyle: FlutterFlowTheme.bodyText1,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.tertiaryColor,
                                prefixIcon: Icon(
                                  Icons.phone_iphone,
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                                suffixIcon: textController.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textController.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.bodyText1,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Field is required';
                                }
                                if (val.length < 13) {
                                  return 'Must include +91';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() => _loadingButton = true);
                                try {
                                  if (!formKey.currentState.validate()) {
                                    return;
                                  }
                                  if (textController.text.isEmpty ||
                                      !textController.text.startsWith('+')) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Phone Number is required and has to start with +.'),
                                      ),
                                    );
                                    return;
                                  }
                                  await beginPhoneAuth(
                                    context: context,
                                    phoneNumber: textController.text,
                                    onCodeSent: () async {
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VerifysmsWidget(),
                                        ),
                                        (r) => false,
                                      );
                                    },
                                  );
                                } finally {
                                  setState(() => _loadingButton = false);
                                }
                              },
                              text: 'Login',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: Color(0xFF080101),
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFFBC02D),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                              loading: _loadingButton,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0, 0.7),
                    child: Text(
                      'If problem in Login call @9234434490',
                      style: FlutterFlowTheme.bodyText1,
                    ),
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
