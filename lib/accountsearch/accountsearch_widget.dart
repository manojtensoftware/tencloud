import '../accountsoptions/accountsoptions_widget.dart';
import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountsearchWidget extends StatefulWidget {
  AccountsearchWidget({Key key}) : super(key: key);

  @override
  _AccountsearchWidgetState createState() => _AccountsearchWidgetState();
}

class _AccountsearchWidgetState extends State<AccountsearchWidget> {
  TextEditingController textController;
  dynamic customerdata;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) =>
              usersRecord.where('uid', isEqualTo: currentUserUid),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Color(0xFFFBC02D),
                ),
              ),
            );
          }
          List<UsersRecord> accountsearchUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final accountsearchUsersRecord =
              accountsearchUsersRecordList.isNotEmpty
                  ? accountsearchUsersRecordList.first
                  : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.primaryColor,
              automaticallyImplyLeading: true,
              title: Text(
                'Account Search',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                  fontSize: 16,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 4,
            ),
            backgroundColor: Color(0xFFF5F5F5),
            body: SafeArea(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Type to Search',
                                  hintStyle: FlutterFlowTheme.bodyText1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.primaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.primaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.person_search_outlined,
                              color: FlutterFlowTheme.primaryColor,
                              size: 40,
                            ),
                            onPressed: () async {
                              customerdata = await partysearchCall(
                                stype: 'CUSTOMERSEARCH',
                                dbase: accountsearchUsersRecord.dataPath,
                                txt: textController.text,
                                cid: 0,
                              );

                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final cdata =
                              getJsonField(customerdata, r'''$.''')?.toList() ??
                                  [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: cdata.length,
                            itemBuilder: (context, cdataIndex) {
                              final cdataItem = cdata[cdataIndex];
                              return InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 200),
                                      reverseDuration:
                                          Duration(milliseconds: 200),
                                      child: AccountsoptionsWidget(
                                        accinfo: cdataItem,
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    getJsonField(
                                            cdataItem, r'''$..account_name''')
                                        .toString(),
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFF20A0A),
                                    ),
                                  ),
                                  subtitle: Text(
                                    getJsonField(cdataItem, r'''$..phone''')
                                        .toString(),
                                    style: FlutterFlowTheme.subtitle2,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
