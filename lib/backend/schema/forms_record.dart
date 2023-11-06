import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormsRecord extends FirestoreRecord {
  FormsRecord._(
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
      FirebaseFirestore.instance.collection('forms');

  static Stream<FormsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormsRecord.fromSnapshot(s));

  static Future<FormsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormsRecord.fromSnapshot(s));

  static FormsRecord fromSnapshot(DocumentSnapshot snapshot) => FormsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormsRecordDocumentEquality implements Equality<FormsRecord> {
  const FormsRecordDocumentEquality();

  @override
  bool equals(FormsRecord? e1, FormsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(FormsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is FormsRecord;
}
