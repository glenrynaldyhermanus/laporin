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

  // "start_at" field.
  DateTime? _startAt;
  DateTime? get startAt => _startAt;
  bool hasStartAt() => _startAt != null;

  // "resume_at" field.
  DateTime? _resumeAt;
  DateTime? get resumeAt => _resumeAt;
  bool hasResumeAt() => _resumeAt != null;

  // "end_at" field.
  DateTime? _endAt;
  DateTime? get endAt => _endAt;
  bool hasEndAt() => _endAt != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _task = snapshotData['task'] as DocumentReference?;
    _form = snapshotData['form'] as DocumentReference?;
    _startAt = snapshotData['start_at'] as DateTime?;
    _resumeAt = snapshotData['resume_at'] as DateTime?;
    _endAt = snapshotData['end_at'] as DateTime?;
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
  DateTime? startAt,
  DateTime? resumeAt,
  DateTime? endAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'task': task,
      'form': form,
      'start_at': startAt,
      'resume_at': resumeAt,
      'end_at': endAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskResponsesRecordDocumentEquality
    implements Equality<TaskResponsesRecord> {
  const TaskResponsesRecordDocumentEquality();

  @override
  bool equals(TaskResponsesRecord? e1, TaskResponsesRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.task == e2?.task &&
        e1?.form == e2?.form &&
        e1?.startAt == e2?.startAt &&
        e1?.resumeAt == e2?.resumeAt &&
        e1?.endAt == e2?.endAt;
  }

  @override
  int hash(TaskResponsesRecord? e) => const ListEquality()
      .hash([e?.user, e?.task, e?.form, e?.startAt, e?.resumeAt, e?.endAt]);

  @override
  bool isValidKey(Object? o) => o is TaskResponsesRecord;
}
