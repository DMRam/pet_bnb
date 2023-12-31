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

  // "start_date_text" field.
  String? _startDateText;
  String get startDateText => _startDateText ?? '';
  bool hasStartDateText() => _startDateText != null;

  // "end_date_text" field.
  String? _endDateText;
  String get endDateText => _endDateText ?? '';
  bool hasEndDateText() => _endDateText != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "pet_ref" field.
  DocumentReference? _petRef;
  DocumentReference? get petRef => _petRef;
  bool hasPetRef() => _petRef != null;

  void _initializeFields() {
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _ownerId = snapshotData['owner_id'] as String?;
    _petId = snapshotData['pet_id'] as String?;
    _startDateText = snapshotData['start_date_text'] as String?;
    _endDateText = snapshotData['end_date_text'] as String?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _petRef = snapshotData['pet_ref'] as DocumentReference?;
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
  String? startDateText,
  String? endDateText,
  DocumentReference? ownerRef,
  DocumentReference? petRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
      'owner_id': ownerId,
      'pet_id': petId,
      'start_date_text': startDateText,
      'end_date_text': endDateText,
      'owner_ref': ownerRef,
      'pet_ref': petRef,
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
        e1?.petId == e2?.petId &&
        e1?.startDateText == e2?.startDateText &&
        e1?.endDateText == e2?.endDateText &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.petRef == e2?.petRef;
  }

  @override
  int hash(BookingPetHostRecord? e) => const ListEquality().hash([
        e?.startDate,
        e?.endDate,
        e?.ownerId,
        e?.petId,
        e?.startDateText,
        e?.endDateText,
        e?.ownerRef,
        e?.petRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingPetHostRecord;
}
