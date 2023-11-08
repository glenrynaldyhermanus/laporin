import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dynamic_field_widget.dart' show DynamicFieldWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DynamicFieldModel extends FlutterFlowModel<DynamicFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Text widget.
  FocusNode? textFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - getResponseField] action in Text widget.
  ResponseFieldsRecord? formResponse;
  // State field(s) for Single-Selection widget.
  FormFieldController<String>? singleSelectionValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Custom Action - getResponseField] action in Picture widget.
  ResponseFieldsRecord? formResponseImage;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get singleSelectionValue => singleSelectionValueController?.value;
}
