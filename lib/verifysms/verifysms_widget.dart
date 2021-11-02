import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../verifystorecode/verifystorecode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifysmsWidget extends StatefulWidget {
  VerifysmsWidget({Key key}) : super(key: key);

  @override
  _VerifysmsWidgetState createState() => _VerifysmsWidgetState();
}

class _VerifysmsWidgetState extends State<VerifysmsWidget> {
  TextEditingController textController;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(-0.05, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'You have recieved a OTP on your \nRegistered Phone no to verify that phone no',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
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
                                EdgeInsetsDirectional.fromSTEB(5, 20, 5, 0),
                            child: TextFormField(
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'OTP NO',
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
                              ),
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() => _loadingButton = true);
                                try {
                                  if (textController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Enter SMS verification code.'),
                                      ),
                                    );
                                    return;
                                  }
                                  final phoneVerifiedUser = await verifySmsCode(
                                    context: context,
                                    smsCode: textController.text,
                                  );
                                  if (phoneVerifiedUser == null) {
                                    return;
                                  }
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          VerifystorecodeWidget(),
                                    ),
                                    (r) => false,
                                  );
                                } finally {
                                  setState(() => _loadingButton = false);
                                }
                              },
                              text: 'Verify',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: Color(0xFF080101),
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
