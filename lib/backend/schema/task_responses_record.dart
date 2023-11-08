import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskResponsesRecord extends FirestoreRecord {
  TaskResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "task" field.
  DocumentReference? _task;
  DocumentReference? get task => _task;
  bool hasTask() => _task != null;

  // "form" field.
  DocumentReference? _form;
  DocumentReference? get form => _form;
  bool hasForm() => _form != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _task = snapshotData['task'] as DocumentReference?;
    _form = snapshotData['form'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('task_responses');

  static Stream<TaskResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskResponsesRecord.fromSnapshot(s));

  static Future<TaskResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskResponsesRecord.fromSnapshot(s));

  static TaskResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaskResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskResponsesRecordData({
  DocumentReference? user,
  DocumentReference? task,
  DocumentReference? form,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'task': task,
      'form': form,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskResponsesRecordDocumentEquality
    implements Equality<TaskResponsesRecord> {
  const TaskResponsesRecordDocumentEquality();

  @override
  bool equals(TaskResponsesRecord? e1, TaskResponsesRecord? e2) {
    return e1?.user == e2?.user && e1?.task == e2?.task && e1?.form == e2?.form;
  }

  @override
  int hash(TaskResponsesRecord? e) =>
      const ListEquality().hash([e?.user, e?.task, e?.form]);

  @override
  bool isValidKey(Object? o) => o is TaskResponsesRecord;
}
