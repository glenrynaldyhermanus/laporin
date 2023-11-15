import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime dateFromStringDdMmYyyy(String dateString) {
  // convert String DD/MM/YYYY to datetime
  return DateFormat('dd/MM/yyyy').parse(dateString);
}

DateTime startingDate(DateTime timestamp) {
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 0, 0, 0);
}

DateTime endingDate(DateTime timestamp) {
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 23, 59, 59);
}

double getLatitude(LatLng latLng) {
  // get latitude of latLng
  return latLng.latitude;
}

double getLongitude(LatLng latLng) {
  return latLng.longitude;
}
