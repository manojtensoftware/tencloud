import 'api_manager.dart';

Future<dynamic> clientsinfoCall({
  String scode = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'clientsinfo',
    apiUrl: 'https://msapi.rlaunch.in/api/clientinfo?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'scode': scode,
    },
    returnResponse: true,
  );
}

Future<dynamic> summaryCall({
  String dbase = '',
  String stype = '',
  int id = 0,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'summary',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'dbase': dbase,
      'stype': stype,
      'id': id,
    },
    returnResponse: true,
  );
}

Future<dynamic> balanceonlyCall({
  String stype = '',
  String dbase = '',
  String txt = '',
  int id = 0,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Balanceonly',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'txt': txt,
      'id': id,
    },
    returnResponse: true,
  );
}

Future<dynamic> allcompanystockvalueCall({
  String stype = 'ALLSTOCK',
  String dbase = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Allcompanystockvalue',
    apiUrl: 'https://msapi.rlaunch.in/api/items?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
    },
    returnResponse: true,
  );
}

Future<dynamic> companystockCall({
  String stype = '',
  String dbase = '',
  int id,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Companystock',
    apiUrl: 'https://msapi.rlaunch.in/api/items?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'id': id,
    },
    returnResponse: true,
  );
}

Future<dynamic> partybalancelistCall({
  String stype = '',
  String dbase = '',
  String txt = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'partybalancelist',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'txt': txt,
    },
    returnResponse: true,
  );
}

Future<dynamic> partysearchCall({
  String stype = '',
  String dbase = '',
  String txt = '',
  int cid = 0,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'partysearch',
    apiUrl: 'https://msapi.rlaunch.in/api/customers?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'txt': txt,
      'cid': cid,
    },
    returnResponse: true,
  );
}

Future<dynamic> inventoryvoucherdetailCall({
  String stype = 'INVENTORYVOUCHERDETAIL',
  String dbase = '',
  String txt = '',
  String txt2 = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Inventoryvoucherdetail',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'txt': txt,
      'txt2': txt2,
    },
    returnResponse: true,
  );
}

Future<dynamic> accountingvoucherdetailCall({
  String stype = 'VOUCHERDETAIL',
  String dbase = '',
  String txt = '',
  String txt2 = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Accountingvoucherdetail',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'txt': txt,
      'txt2': txt2,
    },
    returnResponse: true,
  );
}

Future<dynamic> invoicelistCall({
  String stype = 'INVOICEDETAIL',
  String dbase = '',
  int id,
  String ddate1 = '',
  String ddate2 = '',
  String txt = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Invoicelist',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'id': id,
      'ddate1': ddate1,
      'ddate2': ddate2,
      'txt': txt,
    },
    returnResponse: true,
  );
}

Future<dynamic> partybillwiseduelistCall({
  String stype = 'BILLDUESLIST',
  String dbase = '',
  int id,
  String txt = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Partybillwiseduelist',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'id': id,
      'txt': txt,
    },
    returnResponse: true,
  );
}

Future<dynamic> billadjusteddetailCall({
  String stype = 'BILLADJUSTEDDETAIL',
  String dbase = '',
  int id,
  String txt = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Billadjusteddetail',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'id': id,
      'txt': txt,
    },
    returnResponse: true,
  );
}

Future<dynamic> citylistCall({
  String stype = 'CITY',
  String dbase = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'citylist',
    apiUrl: 'https://msapi.rlaunch.in/api/customers?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
    },
    returnResponse: true,
  );
}

Future<dynamic> companylistCall({
  String stype = 'COMPANY',
  String dbase = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'companylist',
    apiUrl: 'https://msapi.rlaunch.in/api/items?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
    },
    returnResponse: true,
  );
}

Future<dynamic> itemsearchwithstockCall({
  String stype = 'ITEMSEARCHWITHSTOCK',
  String dbase = '',
  int id,
  String txt = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'itemsearchwithstock',
    apiUrl: 'https://msapi.rlaunch.in/api/items?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'id': id,
      'txt': txt,
    },
    returnResponse: true,
  );
}

Future<dynamic> itembyIDCall({
  String stype = 'ITEMBYID',
  String dbase = '',
  int id,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'ItembyID',
    apiUrl: 'https://msapi.rlaunch.in/api/items?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'id': id,
    },
    returnResponse: true,
  );
}

Future<dynamic> ordersavedeleteCall({
  String stype = '',
  String dbase = '',
  int itemCode,
  int cs,
  double pcs,
  double rate,
  double tqty,
  double amount,
  double tdp,
  double cdp,
  double cdr,
  int gst,
  double netAmount,
  String agentPhone = '',
  int id = 0,
  int pid = 0,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'ordersavedelete',
    apiUrl: 'https://msapi.rlaunch.in/api/mobileorder?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'item_code': itemCode,
      'cs': cs,
      'pcs': pcs,
      'rate': rate,
      'tqty': tqty,
      'amount': amount,
      'tdp': tdp,
      'cdp': cdp,
      'cdr': cdr,
      'gst': gst,
      'net_amount': netAmount,
      'agent_phone': agentPhone,
      'id': id,
      'pid': pid,
    },
    returnResponse: true,
  );
}

Future<dynamic> orderlistbypartyCall({
  String stype = '',
  String dbase = '',
  int pid,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Orderlistbyparty',
    apiUrl: 'https://msapi.rlaunch.in/api/mobileorder?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'pid': pid,
    },
    returnResponse: true,
  );
}

Future<dynamic> orderdeleteCall({
  String stype = 'DELETE',
  String dbase = '',
  int id = 0,
  int pid = 0,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Orderdelete',
    apiUrl: 'https://msapi.rlaunch.in/api/mobileorder?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'id': id,
      'pid': pid,
    },
    returnResponse: true,
  );
}

Future<dynamic> recieptCall({
  String stype = '',
  String dbase = '',
  String mobile = '',
  double amount = 0,
  int pid = 0,
  int cash = 0,
  String bill = ' ',
  String refno = ' ',
  int id = 0,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Reciept',
    apiUrl: 'https://msapi.rlaunch.in/api/Reciept?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'mobile': mobile,
      'amount': amount,
      'pid': pid,
      'cash': cash,
      'bill': bill,
      'refno': refno,
      'id': id,
    },
    returnResponse: true,
  );
}

Future<dynamic> userdetailsCall({
  String stype = '',
  String dbase = '',
  String mobile = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Userdetails',
    apiUrl: 'https://msapi.rlaunch.in/api/Users?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'mobile': mobile,
    },
    returnResponse: true,
  );
}

Future<dynamic> usersstatusCall({
  String mobile = '',
  String dbase = '',
  String stype = 'STATUS',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'usersstatus',
    apiUrl: 'https://msapi.rlaunch.in/api/Users',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'mobile': mobile,
      'dbase': dbase,
      'stype': stype,
    },
    returnResponse: true,
  );
}

Future<dynamic> ordersummarybyagentCall({
  String stype = 'ALLSUMMARY',
  String dbase = '',
  String agentPhone = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Ordersummarybyagent',
    apiUrl: 'https://msapi.rlaunch.in/api/mobileorder?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'agent_phone': agentPhone,
    },
    returnResponse: true,
  );
}

Future<dynamic> ledgerCall({
  String stype = 'LEDGER',
  String dbase = '',
  int id,
  String ddate1 = '',
  String txt = '',
  String ddate2 = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'ledger',
    apiUrl: 'https://msapi.rlaunch.in/api/report?',
    callType: ApiCallType.GET,
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
    params: {
      'stype': stype,
      'dbase': dbase,
      'id': id,
      'ddate1': ddate1,
      'txt': txt,
      'ddate2': ddate2,
    },
    returnResponse: true,
  );
}
