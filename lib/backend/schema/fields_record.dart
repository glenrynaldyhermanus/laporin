import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FieldsRecord extends FirestoreRecord {
  FieldsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fields');

  static Stream<FieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FieldsRecord.fromSnapshot(s));

  static Future<FieldsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FieldsRecord.fromSnapshot(s));

  static FieldsRecord fromSnapshot(DocumentSnapshot snapshot) => FieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFieldsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class FieldsRecordDocumentEquality implements Equality<FieldsRecord> {
  const FieldsRecordDocumentEquality();

  @override
  bool equals(FieldsRecord? e1, FieldsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(FieldsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is FieldsRecord;
}
