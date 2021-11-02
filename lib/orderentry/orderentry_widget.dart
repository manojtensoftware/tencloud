import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../companylist/companylist_widget.dart';
import '../components/orderentrycompo_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../orderentryaccountsearch/orderentryaccountsearch_widget.dart';
import '../partybillwiseduelist/partybillwiseduelist_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderentryWidget extends StatefulWidget {
  OrderentryWidget({Key key}) : super(key: key);

  @override
  _OrderentryWidgetState createState() => _OrderentryWidgetState();
}

class _OrderentryWidgetState extends State<OrderentryWidget> {
  TextEditingController textController;
  dynamic itemlist;
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
          List<UsersRecord> orderentryUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final orderentryUsersRecord = orderentryUsersRecordList.isNotEmpty
              ? orderentryUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.primaryColor,
              automaticallyImplyLeading: true,
              title: Text(
                'Order Entry',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                  fontSize: 16,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PartybillwiseduelistWidget(
                                acname: orderentryUsersRecord.selectedPartyName,
                                acid: orderentryUsersRecord.selectedPartyId,
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.view_list,
                          color: FlutterFlowTheme.tertiaryColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                )
              ],
              centerTitle: true,
              elevation: 4,
            ),
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            body: SafeArea(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 60,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OrderentryaccountsearchWidget(),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  'Select Customer',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFF20A0A),
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  orderentryUsersRecord.selectedPartyName,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 60,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CompanylistWidget(),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  'Select Company',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0A691B),
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  orderentryUsersRecord.selectedCompanyName,
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFFBC02D),
                      ),
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
                                  hintText: 'Type to Search item',
                                  hintStyle: FlutterFlowTheme.bodyText1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF11B32E),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF11B32E),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.tertiaryColor,
                                ),
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 50,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.primaryColor,
                                size: 50,
                              ),
                              onPressed: () async {
                                itemlist = await itemsearchwithstockCall(
                                  dbase: orderentryUsersRecord.dataPath,
                                  id: orderentryUsersRecord.selectedCompany,
                                  txt: textController.text,
                                );

                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final itemlistshow =
                              getJsonField(itemlist, r'''$.''')?.toList() ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: itemlistshow.length,
                            itemBuilder: (context, itemlistshowIndex) {
                              final itemlistshowItem =
                                  itemlistshow[itemlistshowIndex];
                              return InkWell(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        child: OrderentrycompoWidget(
                                          prodinfo: itemlistshowItem,
                                          acname: orderentryUsersRecord
                                              .selectedPartyName,
                                          acid: orderentryUsersRecord
                                              .selectedPartyId,
                                          dbase: orderentryUsersRecord.dataPath,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    getJsonField(itemlistshowItem,
                                            r'''$..item_name''')
                                        .toString(),
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  subtitle: Text(
                                    getJsonField(
                                            itemlistshowItem, r'''$..sqty''')
                                        .toString(),
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.add_circle,
                                    color: Color(0xFF303030),
                                    size: 24,
                                  ),
                                  tileColor: FlutterFlowTheme.tertiaryColor,
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
