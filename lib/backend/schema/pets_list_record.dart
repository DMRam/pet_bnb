import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PetsListRecord extends FirestoreRecord {
  PetsListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pets" field.
  String? _pets;
  String get pets => _pets ?? '';
  bool hasPets() => _pets != null;

  void _initializeFields() {
    _pets = snapshotData['pets'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pets_list');

  static Stream<PetsListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsListRecord.fromSnapshot(s));

  static Future<PetsListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetsListRecord.fromSnapshot(s));

  static PetsListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PetsListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsListRecordData({
  String? pets,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pets': pets,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsListRecordDocumentEquality implements Equality<PetsListRecord> {
  const PetsListRecordDocumentEquality();

  @override
  bool equals(PetsListRecord? e1, PetsListRecord? e2) {
    return e1?.pets == e2?.pets;
  }

  @override
  int hash(PetsListRecord? e) => const ListEquality().hash([e?.pets]);

  @override
  bool isValidKey(Object? o) => o is PetsListRecord;
}
