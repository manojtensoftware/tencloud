import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartybalancelistWidget extends StatefulWidget {
  PartybalancelistWidget({
    Key key,
    this.type,
    this.dbase,
  }) : super(key: key);

  final String type;
  final String dbase;

  @override
  _PartybalancelistWidgetState createState() => _PartybalancelistWidgetState();
}

class _PartybalancelistWidgetState extends State<PartybalancelistWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFBC02D),
        automaticallyImplyLeading: true,
        title: Text(
          'Closing Bal of ${widget.type}',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xE6000000),
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
              Expanded(
                child: FutureBuilder<dynamic>(
                  future: partybalancelistCall(
                    stype: 'BALANCELIST',
                    dbase: widget.dbase,
                    txt: widget.type,
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
                    final listViewPartybalancelistResponse = snapshot.data;
                    return Builder(
                      builder: (context) {
                        final partylist = getJsonField(
                                    listViewPartybalancelistResponse, r'''$.''')
                                ?.toList() ??
                            [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: partylist.length,
                          itemBuilder: (context, partylistIndex) {
                            final partylistItem = partylist[partylistIndex];
                            return ListTile(
                              title: Text(
                                getJsonField(
                                        partylistItem, r'''$..account_name''')
                                    .toString(),
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF20A0A),
                                ),
                              ),
                              subtitle: Text(
                                'Rs. ${getJsonField(partylistItem, r'''$..balance''').toString()}',
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF0A691B),
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
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
  }
}
