// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> getTaskResponse(
  DocumentReference userRef,
  DocumentReference taskRef,
) async {
  // get task_responses by tasks and users reference, return null if empty
  final response = await FirebaseFirestore.instance
      .collection('task_responses')
      .where('user_ref', isEqualTo: userRef)
      .where('task_ref', isEqualTo: taskRef)
      .get();
  if (response.docs.isNotEmpty) {
    return response.docs.first.reference;
  } else {
    return null;
  }
}
