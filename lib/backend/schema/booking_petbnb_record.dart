import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BookingPetbnbRecord extends FirestoreRecord {
  BookingPetbnbRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "start_date_string" field.
  String? _startDateString;
  String get startDateString => _startDateString ?? '';
  bool hasStartDateString() => _startDateString != null;

  // "end_date_string" field.
  String? _endDateString;
  String get endDateString => _endDateString ?? '';
  bool hasEndDateString() => _endDateString != null;

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  bool hasOwnerId() => _ownerId != null;

  // "pet_name" field.
  String? _petName;
  String get petName => _petName ?? '';
  bool hasPetName() => _petName != null;

  // "owner_name" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  bool hasOwnerName() => _ownerName != null;

  // "ad_host_id" field.
  String? _adHostId;
  String get adHostId => _adHostId ?? '';
  bool hasAdHostId() => _adHostId != null;

  // "pet_type" field.
  String? _petType;
  String get petType => _petType ?? '';
  bool hasPetType() => _petType != null;

  void _initializeFields() {
    _startDateString = snapshotData['start_date_string'] as String?;
    _endDateString = snapshotData['end_date_string'] as String?;
    _ownerId = snapshotData['owner_id'] as String?;
    _petName = snapshotData['pet_name'] as String?;
    _ownerName = snapshotData['owner_name'] as String?;
    _adHostId = snapshotData['ad_host_id'] as String?;
    _petType = snapshotData['pet_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Booking_petbnb');

  static Stream<BookingPetbnbRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingPetbnbRecord.fromSnapshot(s));

  static Future<BookingPetbnbRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingPetbnbRecord.fromSnapshot(s));

  static BookingPetbnbRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingPetbnbRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingPetbnbRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingPetbnbRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingPetbnbRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingPetbnbRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingPetbnbRecordData({
  String? startDateString,
  String? endDateString,
  String? ownerId,
  String? petName,
  String? ownerName,
  String? adHostId,
  String? petType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start_date_string': startDateString,
      'end_date_string': endDateString,
      'owner_id': ownerId,
      'pet_name': petName,
      'owner_name': ownerName,
      'ad_host_id': adHostId,
      'pet_type': petType,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingPetbnbRecordDocumentEquality
    implements Equality<BookingPetbnbRecord> {
  const BookingPetbnbRecordDocumentEquality();

  @override
  bool equals(BookingPetbnbRecord? e1, BookingPetbnbRecord? e2) {
    return e1?.startDateString == e2?.startDateString &&
        e1?.endDateString == e2?.endDateString &&
        e1?.ownerId == e2?.ownerId &&
        e1?.petName == e2?.petName &&
        e1?.ownerName == e2?.ownerName &&
        e1?.adHostId == e2?.adHostId &&
        e1?.petType == e2?.petType;
  }

  @override
  int hash(BookingPetbnbRecord? e) => const ListEquality().hash([
        e?.startDateString,
        e?.endDateString,
        e?.ownerId,
        e?.petName,
        e?.ownerName,
        e?.adHostId,
        e?.petType
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingPetbnbRecord;
}
