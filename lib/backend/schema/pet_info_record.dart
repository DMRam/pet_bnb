import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PetInfoRecord extends FirestoreRecord {
  PetInfoRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _species = snapshotData['species'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('petInfo')
          : FirebaseFirestore.instance.collectionGroup('petInfo');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('petInfo').doc();

  static Stream<PetInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetInfoRecord.fromSnapshot(s));

  static Future<PetInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetInfoRecord.fromSnapshot(s));

  static PetInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PetInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetInfoRecordData({
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

class PetInfoRecordDocumentEquality implements Equality<PetInfoRecord> {
  const PetInfoRecordDocumentEquality();

  @override
  bool equals(PetInfoRecord? e1, PetInfoRecord? e2) {
    return e1?.name == e2?.name && e1?.species == e2?.species;
  }

  @override
  int hash(PetInfoRecord? e) =>
      const ListEquality().hash([e?.name, e?.species]);

  @override
  bool isValidKey(Object? o) => o is PetInfoRecord;
}
