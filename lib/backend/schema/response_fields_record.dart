import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseFieldsRecord extends FirestoreRecord {
  ResponseFieldsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "form_field" field.
  DocumentReference? _formField;
  DocumentReference? get formField => _formField;
  bool hasFormField() => _formField != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
    _formField = snapshotData['form_field'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('response_fields')
          : FirebaseFirestore.instance.collectionGroup('response_fields');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('response_fields').doc();

  static Stream<ResponseFieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponseFieldsRecord.fromSnapshot(s));

  static Future<ResponseFieldsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponseFieldsRecord.fromSnapshot(s));

  static ResponseFieldsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponseFieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponseFieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponseFieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponseFieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponseFieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponseFieldsRecordData({
  String? question,
  String? answer,
  DocumentReference? formField,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'answer': answer,
      'form_field': formField,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResponseFieldsRecordDocumentEquality
    implements Equality<ResponseFieldsRecord> {
  const ResponseFieldsRecordDocumentEquality();

  @override
  bool equals(ResponseFieldsRecord? e1, ResponseFieldsRecord? e2) {
    return e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        e1?.formField == e2?.formField;
  }

  @override
  int hash(ResponseFieldsRecord? e) =>
      const ListEquality().hash([e?.question, e?.answer, e?.formField]);

  @override
  bool isValidKey(Object? o) => o is ResponseFieldsRecord;
}
