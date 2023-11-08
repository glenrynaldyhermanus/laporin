import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_field_model.dart';
export 'dynamic_field_model.dart';

class DynamicFieldWidget extends StatefulWidget {
  const DynamicFieldWidget({
    Key? key,
    required this.formField,
    required this.taskResponse,
  }) : super(key: key);

  final FormFieldsRecord? formField;
  final TaskResponsesRecord? taskResponse;

  @override
  _DynamicFieldWidgetState createState() => _DynamicFieldWidgetState();
}

class _DynamicFieldWidgetState extends State<DynamicFieldWidget> {
  late DynamicFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicFieldModel());

    _model.textController ??= TextEditingController();
    _model.textFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget.formField?.question,
                'Question',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            Builder(
              builder: (context) {
                if (widget.formField?.field?.id == 'dcwGbvd7lKDGs7Mn4zPU') {
                  return TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 2000),
                      () async {
                        var _shouldSetState = false;
                        _model.formResponse = await actions.getResponseField(
                          widget.taskResponse!.reference,
                          widget.formField!.reference,
                        );
                        _shouldSetState = true;
                        if (_model.formResponse != null) {
                          await _model.formResponse!.reference
                              .update(createResponseFieldsRecordData(
                            answer: _model.textController.text,
                          ));
                          if (_shouldSetState) setState(() {});
                          return;
                        } else {
                          await ResponseFieldsRecord.createDoc(
                                  widget.taskResponse!.reference)
                              .set(createResponseFieldsRecordData(
                            question: widget.formField?.question,
                            answer: _model.textController.text,
                            formField: widget.formField?.reference,
                          ));
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_shouldSetState) setState(() {});
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC5C5C5),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  );
                } else if (widget.formField?.field?.id ==
                    'K3D6DJyZbrWki3C7IoZE') {
                  return FlutterFlowRadioButton(
                    options: ['Option 1', 'Option 2'].toList(),
                    onChanged: (val) => setState(() {}),
                    controller: _model.singleSelectionValueController ??=
                        FormFieldController<String>(null),
                    optionHeight: 32.0,
                    textStyle: FlutterFlowTheme.of(context).labelMedium,
                    selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium,
                    buttonPosition: RadioButtonPosition.left,
                    direction: Axis.vertical,
                    radioButtonColor: FlutterFlowTheme.of(context).primary,
                    inactiveRadioButtonColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    toggleable: false,
                    horizontalAlignment: WrapAlignment.start,
                    verticalAlignment: WrapCrossAlignment.start,
                  );
                } else if (widget.formField?.field?.id ==
                    'O1FqDM12BPNHaM8utVWY') {
                  return Builder(
                    builder: (context) {
                      if (_model.uploadedFileUrl != null &&
                          _model.uploadedFileUrl != '') {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            getCORSProxyUrl(
                              _model.uploadedFileUrl,
                            ),
                            width: double.infinity,
                            height: 180.0,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                              pickerFontFamily: 'Montserrat',
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }

                            _model.formResponseImage =
                                await actions.getResponseField(
                              widget.taskResponse!.reference,
                              widget.formField!.reference,
                            );
                            _shouldSetState = true;
                            if (_model.formResponseImage?.reference != null) {
                              await _model.formResponse!.reference
                                  .update(createResponseFieldsRecordData(
                                answer: _model.uploadedFileUrl,
                              ));
                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              await ResponseFieldsRecord.createDoc(
                                      widget.taskResponse!.reference)
                                  .set(createResponseFieldsRecordData(
                                formField: widget.formField?.reference,
                                question: widget.formField?.question,
                                answer: _model.uploadedFileUrl,
                              ));
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            height: 180.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_enhance_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 48.0,
                                ),
                                Text(
                                  'Add a picture',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  );
                }
              },
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
