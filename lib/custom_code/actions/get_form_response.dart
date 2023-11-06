// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<FormResponsesRecord?> getFormResponse(
  DocumentReference task,
  DocumentReference formField,
) async {
  DocumentSnapshot taskSnapshot = await task.get();
  if (!taskSnapshot.exists) {
    return null;
  }

  // Get the form_responses subcollection of the task document
  CollectionReference formResponsesCollection =
      task.collection('form_responses');

  // Query the form_responses subcollection for documents where form_field is equal to formField
  QuerySnapshot formResponsesQuery = await formResponsesCollection
      .where('form_field', isEqualTo: formField)
      .get();

  // If there are no matching documents, return null
  if (formResponsesQuery.docs.isEmpty) {
    return null;
  }

  return FormResponsesRecord.fromSnapshot(formResponsesQuery.docs.first);
}
