import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class OwnersPetRecord extends FirestoreRecord {
  OwnersPetRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "species" field.
  String? _species;
  String get species => _species ?? '';
  bool hasSpecies() => _species != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _species = snapshotData['species'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('owners_pet');

  static Stream<OwnersPetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OwnersPetRecord.fromSnapshot(s));

  static Future<OwnersPetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OwnersPetRecord.fromSnapshot(s));

  static OwnersPetRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OwnersPetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OwnersPetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OwnersPetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OwnersPetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OwnersPetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOwnersPetRecordData({
  String? name,
  String? species,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'species': species,
    }.withoutNulls,
  );

  return firestoreData;
}

class OwnersPetRecordDocumentEquality implements Equality<OwnersPetRecord> {
  const OwnersPetRecordDocumentEquality();

  @override
  bool equals(OwnersPetRecord? e1, OwnersPetRecord? e2) {
    return e1?.name == e2?.name && e1?.species == e2?.species;
  }

  @override
  int hash(OwnersPetRecord? e) =>
      const ListEquality().hash([e?.name, e?.species]);

  @override
  bool isValidKey(Object? o) => o is OwnersPetRecord;
}
