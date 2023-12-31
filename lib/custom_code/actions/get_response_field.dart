// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ResponseFieldsRow?> getResponseField(
  int fieldId,
  int responseId,
) async {
  // Add your function code here!
  final result = await ResponseFieldsTable().queryRows(
    queryFn: (q) => q
        .eq(
          'field_id',
          fieldId,
        )
        .eq(
          'response_id',
          responseId,
        ),
  );

  if (result.isNotEmpty) {
    return result.first;
  }
  return null;
}
