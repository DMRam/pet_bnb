import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class HostsAdsRecord extends FirestoreRecord {
  HostsAdsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "host_place" field.
  List<String>? _hostPlace;
  List<String> get hostPlace => _hostPlace ?? const [];
  bool hasHostPlace() => _hostPlace != null;

  // "services_included" field.
  List<String>? _servicesIncluded;
  List<String> get servicesIncluded => _servicesIncluded ?? const [];
  bool hasServicesIncluded() => _servicesIncluded != null;

  // "pets_allowed" field.
  List<String>? _petsAllowed;
  List<String> get petsAllowed => _petsAllowed ?? const [];
  bool hasPetsAllowed() => _petsAllowed != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "host_place_location" field.
  LatLng? _hostPlaceLocation;
  LatLng? get hostPlaceLocation => _hostPlaceLocation;
  bool hasHostPlaceLocation() => _hostPlaceLocation != null;

  // "host_data" field.
  String? _hostData;
  String get hostData => _hostData ?? '';
  bool hasHostData() => _hostData != null;

  void _initializeFields() {
    _hostPlace = getDataList(snapshotData['host_place']);
    _servicesIncluded = getDataList(snapshotData['services_included']);
    _petsAllowed = getDataList(snapshotData['pets_allowed']);
    _comments = snapshotData['comments'] as String?;
    _hostPlaceLocation = snapshotData['host_place_location'] as LatLng?;
    _hostData = snapshotData['host_data'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hosts_ads');

  static Stream<HostsAdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HostsAdsRecord.fromSnapshot(s));

  static Future<HostsAdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HostsAdsRecord.fromSnapshot(s));

  static HostsAdsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HostsAdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HostsAdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HostsAdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HostsAdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HostsAdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHostsAdsRecordData({
  String? comments,
  LatLng? hostPlaceLocation,
  String? hostData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comments': comments,
      'host_place_location': hostPlaceLocation,
      'host_data': hostData,
    }.withoutNulls,
  );

  return firestoreData;
}

class HostsAdsRecordDocumentEquality implements Equality<HostsAdsRecord> {
  const HostsAdsRecordDocumentEquality();

  @override
  bool equals(HostsAdsRecord? e1, HostsAdsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.hostPlace, e2?.hostPlace) &&
        listEquality.equals(e1?.servicesIncluded, e2?.servicesIncluded) &&
        listEquality.equals(e1?.petsAllowed, e2?.petsAllowed) &&
        e1?.comments == e2?.comments &&
        e1?.hostPlaceLocation == e2?.hostPlaceLocation &&
        e1?.hostData == e2?.hostData;
  }

  @override
  int hash(HostsAdsRecord? e) => const ListEquality().hash([
        e?.hostPlace,
        e?.servicesIncluded,
        e?.petsAllowed,
        e?.comments,
        e?.hostPlaceLocation,
        e?.hostData
      ]);

  @override
  bool isValidKey(Object? o) => o is HostsAdsRecord;
}
