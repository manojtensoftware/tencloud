import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import '../../auth/auth_util.dart';

int monthno(DateTime date1) {
  return date1.month;
}

int roundoff(double valu) {
  return valu.round();
}

String formatdateforquery(DateTime date1) {
  var newFormat = DateFormat("yyyy-MM-dd");
  String updatedDt = newFormat.format(date1);
  return updatedDt;
}

int calculatetqty(
  int cs,
  int pcs,
  int csqty,
  int stockqty,
) {
  int tqty;
  tqty = 0;
  if (cs == 0 && pcs == 0) {
    return 0;
  } else {
    tqty = cs * csqty;
    tqty = tqty + pcs;
    if (tqty >= stockqty) {
      return 0;
    } else {
      return tqty;
    }
  }
}

double calculateamount(
  double rate,
  int rateper,
  double cs,
  double pcs,
  int csqty,
  double stockqty,
) {
  double tqty;
  tqty = 00.00;
  if (cs == 0 && pcs == 0) {
    tqty = 0;
  } else {
    tqty = cs * csqty;
    tqty = tqty + pcs;
    if (tqty >= stockqty) {
      tqty = 0;
    }
  }
  double amt;
  amt = 00.00;
  if (tqty == 0 || rate == 0) {
    return amt;
  } else {
    if (rateper == 0) {
      amt = tqty * rate;
      return amt;
    } else {
      amt = tqty * rate / rateper;
      return amt;
    }
  }

  // Add your function code here!
}

double netamount(
  double cs,
  double cdp,
  double tdp,
  double cdr,
  int gst,
  double pcs,
  int csqty,
  double stockqty,
  double rate,
  double rateper,
) {
  double tqty;
  tqty = 00.00;
  if (cs == 0 && pcs == 0) {
    tqty = 0;
  } else {
    tqty = cs * csqty;
    tqty = tqty + pcs;
    if (tqty >= stockqty) {
      tqty = 0;
    }
  }
  double amt;
  amt = 00.00;
  if (tqty == 0 || rate == 0) {
    amt = 0;
  } else {
    if (rateper == 0) {
      amt = tqty * rate;
    } else {
      amt = tqty * rate / rateper;
    }
  }
  amt = amt - (amt * cdp / 100);
  amt = amt - (amt * tdp / 100);
  amt = amt - cdr;
  amt = amt + (amt * gst / 100);
  amt = double.parse((amt).toStringAsFixed(2));
  return amt;
}

int convertbooltoint(bool val) {
  if (val == true) {
    return 1;
  } else {
    return 0;
  }
  // Add your function code here!
}

String mobilenoformat(String mobileno) {
  return mobileno.substring(3);
}

bool convertinttobool(
  double vals,
  String colrs,
) {
  bool stt = true;
  if (colrs == 'G' && vals < 0) {
    stt = false;
  }
  if (colrs == 'R' && vals > -1) {
    stt = false;
  }
  return stt;
  // Add your function code here!
}
