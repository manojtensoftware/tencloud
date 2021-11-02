import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/justblank_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../orderlist/orderlist_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class OrderentrycompoWidget extends StatefulWidget {
  OrderentrycompoWidget({
    Key key,
    this.prodinfo,
    this.acname,
    this.acid,
    this.dbase,
  }) : super(key: key);

  final dynamic prodinfo;
  final String acname;
  final int acid;
  final String dbase;

  @override
  _OrderentrycompoWidgetState createState() => _OrderentrycompoWidgetState();
}

class _OrderentrycompoWidgetState extends State<OrderentrycompoWidget> {
  TextEditingController cdpController;
  TextEditingController csController;
  TextEditingController pcsController;
  TextEditingController csQtyController;
  TextEditingController rateController;
  TextEditingController tdpController;
  TextEditingController cdrController;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cdpController = TextEditingController(text: '0');
    csController = TextEditingController(text: '0');
    pcsController = TextEditingController(text: '0');
    csQtyController = TextEditingController(
        text: getJsonField(widget.prodinfo, r'''$..cs_qty''').toString());
    rateController = TextEditingController(
        text: getJsonField(widget.prodinfo, r'''$..sale_rate''').toString());
    tdpController = TextEditingController(text: '0');
    cdrController = TextEditingController(text: '0');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: FutureBuilder<dynamic>(
        future: itembyIDCall(
          dbase: widget.dbase,
          id: getJsonField(widget.prodinfo, r'''$..icode'''),
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
          final containerItembyIDResponse = snapshot.data;
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.tertiaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          widget.acname,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            getJsonField(widget.prodinfo, r'''$..item_name''')
                                .toString(),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: Text(
                          getJsonField(widget.prodinfo, r'''$..sqty''')
                              .toString(),
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFF20A0A),
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 2, 0),
                          child: TextFormField(
                            onFieldSubmitted: (_) async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Calculating..',
                                    style: TextStyle(),
                                  ),
                                  duration: Duration(milliseconds: 50),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                            },
                            controller: csController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'CS',
                              labelStyle: FlutterFlowTheme.bodyText1,
                              hintText: 'Qty',
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
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Only Numbers';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 2, 0),
                          child: TextFormField(
                            controller: pcsController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Pcs',
                              labelStyle: FlutterFlowTheme.bodyText1,
                              hintText: 'Qty',
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
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Only Numbers';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 2, 0),
                          child: TextFormField(
                            controller: csQtyController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Cs QTy',
                              labelStyle: FlutterFlowTheme.bodyText1,
                              hintText: 'Qty',
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
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Only Numbers';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 2, 0),
                          child: TextFormField(
                            onFieldSubmitted: (_) async {
                              await Share.share('');
                            },
                            controller: rateController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Rate',
                              labelStyle: FlutterFlowTheme.bodyText1,
                              hintText: 'Rate',
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
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Only Numbers';
                              }

                              return null;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Total Qty',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(9, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                          child: Text(
                            functions
                                .calculatetqty(
                                    int.parse(csController.text),
                                    int.parse(pcsController.text),
                                    int.parse(csQtyController.text),
                                    getJsonField(
                                        widget.prodinfo, r'''$..sqty'''))
                                .toString()
                                .toString(),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Amount',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                          child: Text(
                            functions
                                .calculateamount(
                                    double.parse(rateController.text),
                                    getJsonField(containerItembyIDResponse,
                                        r'''$..rate_per'''),
                                    double.parse(csController.text),
                                    double.parse(pcsController.text),
                                    int.parse(csQtyController.text),
                                    getJsonField(
                                        widget.prodinfo, r'''$..sqty'''))
                                .toString()
                                .toString(),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Sch%',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          child: TextFormField(
                            controller: cdpController,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Cd%',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          child: TextFormField(
                            controller: tdpController,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Disc(Rs)',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          child: TextFormField(
                            controller: cdrController,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.primaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Gst%',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                        child: Text(
                          getJsonField(containerItembyIDResponse, r'''$..gst''')
                              .toString(),
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Net Amount',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                        child: Text(
                          functions
                              .netamount(
                                  double.parse(csController.text),
                                  double.parse(cdpController.text),
                                  double.parse(tdpController.text),
                                  double.parse(cdrController.text),
                                  getJsonField(
                                      containerItembyIDResponse, r'''$..gst'''),
                                  double.parse(pcsController.text),
                                  int.parse(csQtyController.text),
                                  getJsonField(widget.prodinfo, r'''$..sqty''')
                                      .toDouble(),
                                  double.parse(rateController.text),
                                  getJsonField(containerItembyIDResponse,
                                      r'''$..rate_per'''))
                              .toString()
                              .toString(),
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton1 = true);
                        try {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: JustblankWidget(),
                              );
                            },
                          );
                        } finally {
                          setState(() => _loadingButton1 = false);
                        }
                      },
                      text: '',
                      icon: Icon(
                        Icons.cached,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 50,
                        height: 30,
                        color: FlutterFlowTheme.primaryColor,
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
                      loading: _loadingButton1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton2 = true);
                          try {
                            if (!formKey.currentState.validate()) {
                              return;
                            }
                            await ordersavedeleteCall(
                              stype: 'INSERT',
                              dbase: widget.dbase,
                              itemCode: getJsonField(
                                  widget.prodinfo, r'''$..icode'''),
                              cs: int.parse(csController.text),
                              pcs: double.parse(pcsController.text),
                              rate: double.parse(rateController.text),
                              tqty: functions
                                  .calculatetqty(
                                      int.parse(csController.text),
                                      int.parse(pcsController.text),
                                      int.parse(csQtyController.text),
                                      getJsonField(
                                          widget.prodinfo, r'''$..sqty'''))
                                  .toDouble()
                                  .toDouble(),
                              amount: functions.calculateamount(
                                  double.parse(rateController.text),
                                  getJsonField(containerItembyIDResponse,
                                      r'''$..rate_per'''),
                                  double.parse(csController.text),
                                  double.parse(pcsController.text),
                                  int.parse(csQtyController.text),
                                  getJsonField(
                                      widget.prodinfo, r'''$..sqty''')),
                              tdp: double.parse(tdpController.text),
                              cdp: double.parse(cdpController.text),
                              cdr: double.parse(cdrController.text),
                              gst: getJsonField(
                                  containerItembyIDResponse, r'''$..gst'''),
                              agentPhone:
                                  functions.mobilenoformat(currentPhoneNumber),
                              pid: widget.acid,
                              netAmount: functions.netamount(
                                  double.parse(csController.text),
                                  double.parse(cdpController.text),
                                  double.parse(tdpController.text),
                                  double.parse(cdrController.text),
                                  getJsonField(
                                      containerItembyIDResponse, r'''$..gst'''),
                                  double.parse(pcsController.text),
                                  int.parse(csQtyController.text),
                                  getJsonField(widget.prodinfo, r'''$..sqty'''),
                                  double.parse(rateController.text),
                                  getJsonField(containerItembyIDResponse,
                                      r'''$..rate_per''')),
                            );
                            Navigator.pop(context);
                          } finally {
                            setState(() => _loadingButton2 = false);
                          }
                        },
                        text: 'Save',
                        icon: Icon(
                          Icons.save,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 100,
                          height: 30,
                          color: FlutterFlowTheme.primaryColor,
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
                        loading: _loadingButton2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 5, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton3 = true);
                          try {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderlistWidget(
                                  acid: widget.acid,
                                  acname: widget.acname,
                                  dbase: widget.dbase,
                                ),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton3 = false);
                          }
                        },
                        text: 'List',
                        icon: Icon(
                          Icons.list,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 100,
                          height: 30,
                          color: FlutterFlowTheme.primaryColor,
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
                        loading: _loadingButton3,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'Press ',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.cached,
                      color: FlutterFlowTheme.primaryColor,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'for Calculation',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
