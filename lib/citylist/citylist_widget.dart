import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CitylistWidget extends StatefulWidget {
  CitylistWidget({Key key}) : super(key: key);

  @override
  _CitylistWidgetState createState() => _CitylistWidgetState();
}

class _CitylistWidgetState extends State<CitylistWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          List<UsersRecord> citylistUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final citylistUsersRecord = citylistUsersRecordList.isNotEmpty
              ? citylistUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.primaryColor,
              automaticallyImplyLeading: true,
              title: Text(
                'Area List',
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
                alignment: AlignmentDirectional(-0.05, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FutureBuilder<dynamic>(
                        future: citylistCall(
                          dbase: citylistUsersRecord.dataPath,
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
                          final listViewCitylistResponse = snapshot.data;
                          return Builder(
                            builder: (context) {
                              final citylist = getJsonField(
                                          listViewCitylistResponse, r'''$.''')
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: citylist.length,
                                itemBuilder: (context, citylistIndex) {
                                  final citylistItem = citylist[citylistIndex];
                                  return InkWell(
                                    onTap: () async {
                                      final usersUpdateData =
                                          createUsersRecordData(
                                        selectedCity: getJsonField(
                                            citylistItem, r'''$..id'''),
                                        selectedCityName: getJsonField(
                                                citylistItem, r'''$..city''')
                                            .toString(),
                                      );
                                      await citylistUsersRecord.reference
                                          .update(usersUpdateData);
                                      Navigator.pop(context);
                                    },
                                    child: ListTile(
                                      title: Text(
                                        getJsonField(
                                                citylistItem, r'''$..city''')
                                            .toString(),
                                        style: FlutterFlowTheme.title3,
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
