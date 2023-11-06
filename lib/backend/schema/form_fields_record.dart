import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormFieldsRecord extends FirestoreRecord {
  FormFieldsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "field" field.
  DocumentReference? _field;
  DocumentReference? get field => _field;
  bool hasField() => _field != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _field = snapshotData['field'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('form_fields')
          : FirebaseFirestore.instance.collectionGroup('form_fields');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('form_fields').doc();

  static Stream<FormFieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormFieldsRecord.fromSnapshot(s));

  static Future<FormFieldsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormFieldsRecord.fromSnapshot(s));

  static FormFieldsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FormFieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormFieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormFieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormFieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormFieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormFieldsRecordData({
  String? question,
  DocumentReference? field,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'field': field,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormFieldsRecordDocumentEquality implements Equality<FormFieldsRecord> {
  const FormFieldsRecordDocumentEquality();

  @override
  bool equals(FormFieldsRecord? e1, FormFieldsRecord? e2) {
    return e1?.question == e2?.question && e1?.field == e2?.field;
  }

  @override
  int hash(FormFieldsRecord? e) =>
      const ListEquality().hash([e?.question, e?.field]);

  @override
  bool isValidKey(Object? o) => o is FormFieldsRecord;
}
