import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BookingPetHostRecord extends FirestoreRecord {
  BookingPetHostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  bool hasOwnerId() => _ownerId != null;

  // "pet_id" field.
  String? _petId;
  String get petId => _petId ?? '';
  bool hasPetId() => _petId != null;

  void _initializeFields() {
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _ownerId = snapshotData['owner_id'] as String?;
    _petId = snapshotData['pet_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking_pet_host');

  static Stream<BookingPetHostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingPetHostRecord.fromSnapshot(s));

  static Future<BookingPetHostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingPetHostRecord.fromSnapshot(s));

  static BookingPetHostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingPetHostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingPetHostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingPetHostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingPetHostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingPetHostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingPetHostRecordData({
  DateTime? startDate,
  DateTime? endDate,
  String? ownerId,
  String? petId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
      'owner_id': ownerId,
      'pet_id': petId,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingPetHostRecordDocumentEquality
    implements Equality<BookingPetHostRecord> {
  const BookingPetHostRecordDocumentEquality();

  @override
  bool equals(BookingPetHostRecord? e1, BookingPetHostRecord? e2) {
    return e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.ownerId == e2?.ownerId &&
        e1?.petId == e2?.petId;
  }

  @override
  int hash(BookingPetHostRecord? e) => const ListEquality()
      .hash([e?.startDate, e?.endDate, e?.ownerId, e?.petId]);

  @override
  bool isValidKey(Object? o) => o is BookingPetHostRecord;
}
