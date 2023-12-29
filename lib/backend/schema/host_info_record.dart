import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class HostInfoRecord extends FirestoreRecord {
  HostInfoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('hostInfo')
          : FirebaseFirestore.instance.collectionGroup('hostInfo');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('hostInfo').doc();

  static Stream<HostInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HostInfoRecord.fromSnapshot(s));

  static Future<HostInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HostInfoRecord.fromSnapshot(s));

  static HostInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HostInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HostInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HostInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HostInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HostInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHostInfoRecordData({
  String? email,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class HostInfoRecordDocumentEquality implements Equality<HostInfoRecord> {
  const HostInfoRecordDocumentEquality();

  @override
  bool equals(HostInfoRecord? e1, HostInfoRecord? e2) {
    return e1?.email == e2?.email && e1?.name == e2?.name;
  }

  @override
  int hash(HostInfoRecord? e) => const ListEquality().hash([e?.email, e?.name]);

  @override
  bool isValidKey(Object? o) => o is HostInfoRecord;
}
