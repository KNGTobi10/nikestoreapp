import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FavoriteRecord extends FirestoreRecord {
  FavoriteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorite');

  static Stream<FavoriteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoriteRecord.fromSnapshot(s));

  static Future<FavoriteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoriteRecord.fromSnapshot(s));

  static FavoriteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoriteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoriteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoriteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoriteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoriteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoriteRecordData({
  String? name,
  double? price,
  String? image,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'image': image,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoriteRecordDocumentEquality implements Equality<FavoriteRecord> {
  const FavoriteRecordDocumentEquality();

  @override
  bool equals(FavoriteRecord? e1, FavoriteRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description;
  }

  @override
  int hash(FavoriteRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.image, e?.description]);

  @override
  bool isValidKey(Object? o) => o is FavoriteRecord;
}
