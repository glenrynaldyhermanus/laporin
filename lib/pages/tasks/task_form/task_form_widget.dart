import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dynamic_field/dynamic_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_form_model.dart';
export 'task_form_model.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final DocumentReference? task;

  @override
  _TaskFormWidgetState createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  late TaskFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskFormModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return StreamBuilder<TasksRecord>(
      stream: TasksRecord.getDocument(widget.task!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final taskFormTasksRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                taskFormTasksRecord.name,
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: StreamBuilder<List<TaskResponsesRecord>>(
                      stream: queryTaskResponsesRecord(
                        queryBuilder: (taskResponsesRecord) =>
                            taskResponsesRecord
                                .where(
                                  'user',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'task',
                                  isEqualTo: widget.task,
                                ),
                        singleRecord: true,
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
                        List<TaskResponsesRecord>
                            containerTaskResponsesRecordList = snapshot.data!;
                        final containerTaskResponsesRecord =
                            containerTaskResponsesRecordList.isNotEmpty
                                ? containerTaskResponsesRecordList.first
                                : null;

                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: StreamBuilder<List<FormFieldsRecord>>(
                            stream: queryFormFieldsRecord(
                              parent: taskFormTasksRecord.form,
                            ),
                            builder: (context, snapshot) {

                              print('OUT >> ');
                              print(snapshot);

                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFoldingCube(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<FormFieldsRecord>
                                  columnFormFieldsRecordList = snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                          columnFormFieldsRecordList.length,
                                          (columnIndex) {
                                    final columnFormFieldsRecord =
                                        columnFormFieldsRecordList[columnIndex];
                                    return DynamicFieldWidget(
                                      key: Key(
                                          'Key0yv_${columnIndex}_of_${columnFormFieldsRecordList.length}'),
                                      formField: columnFormFieldsRecord,
                                      taskResponse:
                                          containerTaskResponsesRecord!,
                                    );
                                  })
                                      .divide(SizedBox(height: 16.0))
                                      .around(SizedBox(height: 16.0)),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await taskFormTasksRecord.reference
                            .update(createTasksRecordData(
                          status: 'Done',
                          doneAt: getCurrentTimestamp,
                        ));
                        context.safePop();
                      },
                      text: 'Save',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
