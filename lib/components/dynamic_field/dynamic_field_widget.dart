import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
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
    required this.field,
    required this.response,
  }) : super(key: key);

  final FieldsRow? field;
  final ResponsesRow? response;

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
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: FutureBuilder<List<ResponseFieldsRow>>(
        future: ResponseFieldsTable().querySingleRow(
          queryFn: (q) => q
              .eq(
                'field_id',
                widget.field?.id,
              )
              .eq(
                'response_id',
                widget.response?.id,
              ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          List<ResponseFieldsRow> containerResponseFieldsRowList =
              snapshot.data!;
          final containerResponseFieldsRow =
              containerResponseFieldsRowList.isNotEmpty
                  ? containerResponseFieldsRowList.first
                  : null;
          return Container(
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
                    widget.field?.question,
                    'Q :',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Builder(
                  builder: (context) {
                    if (widget.field?.fieldTypeId == 1) {
                      return TextFormField(
                        controller: _model.textController ??=
                            TextEditingController(
                          text: containerResponseFieldsRow?.answer,
                        ),
                        focusNode: _model.textFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 2000),
                          () async {
                            var _shouldSetState = false;
                            _model.textResponseField =
                                await actions.getResponseField(
                              widget.field!.id,
                              widget.response!.id,
                            );
                            _shouldSetState = true;
                            if (_model.textResponseField != null) {
                              await ResponseFieldsTable().update(
                                data: {
                                  'answer': _model.textController.text,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.textResponseField?.id,
                                ),
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              await ResponseFieldsTable().insert({
                                'field_id': widget.field?.id,
                                'response_id': widget.response?.id,
                                'answer': _model.textController.text,
                              });
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
                    } else if (widget.field?.fieldTypeId == 4) {
                      return FlutterFlowRadioButton(
                        options: ['Option 1', 'Option 2'].toList(),
                        onChanged: (val) => setState(() {}),
                        controller: _model.singleSelectionValueController ??=
                            FormFieldController<String>(null),
                        optionHeight: 32.0,
                        textStyle: FlutterFlowTheme.of(context).labelMedium,
                        selectedTextStyle:
                            FlutterFlowTheme.of(context).bodyMedium,
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor: FlutterFlowTheme.of(context).primary,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      );
                    } else if (widget.field?.fieldTypeId == 6) {
                      return Builder(
                        builder: (context) {
                          if (_model.textController.text != null &&
                              _model.textController.text != '') {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                getCORSProxyUrl(
                                  'https://picsum.photos/seed/623/600',
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
                                  storageFolderPath: '${widget.response?.uuid}',
                                  maxWidth: 480.00,
                                  maxHeight: 480.00,
                                  allowPhoto: true,
                                  pickerFontFamily: 'Montserrat',
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls =
                                        await uploadSupabaseStorageFiles(
                                      bucketName: 'responses',
                                      selectedFiles: selectedMedia,
                                    );
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }

                                _model.responseField =
                                    await actions.getResponseField(
                                  widget.field!.id,
                                  widget.response!.id,
                                );
                                _shouldSetState = true;
                                if (_model.responseField != null) {
                                  await ResponseFieldsTable().update(
                                    data: {
                                      'answer': _model.uploadedFileUrl,
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      _model.responseField?.id,
                                    ),
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  await ResponseFieldsTable().insert({
                                    'field_id': widget.field?.id,
                                    'response_id': widget.response?.id,
                                    'answer': _model.uploadedFileUrl,
                                  });
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      );
                    }
                  },
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          );
        },
      ),
    );
  }
}
