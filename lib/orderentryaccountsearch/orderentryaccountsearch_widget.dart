import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../citylist/citylist_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderentryaccountsearchWidget extends StatefulWidget {
  OrderentryaccountsearchWidget({Key key}) : super(key: key);

  @override
  _OrderentryaccountsearchWidgetState createState() =>
      _OrderentryaccountsearchWidgetState();
}

class _OrderentryaccountsearchWidgetState
    extends State<OrderentryaccountsearchWidget> {
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
          List<UsersRecord> orderentryaccountsearchUsersRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final orderentryaccountsearchUsersRecord =
              orderentryaccountsearchUsersRecordList.isNotEmpty
                  ? orderentryaccountsearchUsersRecordList.first
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.93,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CitylistWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    'Select Area',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  subtitle: Text(
                                    orderentryaccountsearchUsersRecord
                                        .selectedCityName,
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
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
                          FutureBuilder<dynamic>(
                            future: partysearchCall(
                              stype: 'CUSTOMERSEARCH',
                              dbase:
                                  orderentryaccountsearchUsersRecord.dataPath,
                              txt: textController.text,
                              cid: orderentryaccountsearchUsersRecord
                                  .selectedCity,
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
                              final iconButtonPartysearchResponse =
                                  snapshot.data;
                              return FlutterFlowIconButton(
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
                                    dbase: orderentryaccountsearchUsersRecord
                                        .dataPath,
                                    txt: textController.text,
                                    cid: orderentryaccountsearchUsersRecord
                                        .selectedCity,
                                  );

                                  setState(() {});
                                },
                              );
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
                                  final usersUpdateData = createUsersRecordData(
                                    selectedPartyName: getJsonField(
                                            cdataItem, r'''$..account_name''')
                                        .toString(),
                                    selectedPartyId:
                                        getJsonField(cdataItem, r'''$..id'''),
                                  );
                                  await orderentryaccountsearchUsersRecord
                                      .reference
                                      .update(usersUpdateData);
                                  Navigator.pop(context);
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
