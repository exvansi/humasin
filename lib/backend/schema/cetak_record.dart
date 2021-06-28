import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cetak_record.g.dart';

abstract class CetakRecord implements Built<CetakRecord, CetakRecordBuilder> {
  static Serializer<CetakRecord> get serializer => _$cetakRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'judul_cetak')
  String get judulCetak;

  @nullable
  @BuiltValueField(wireName: 'media_cetak')
  String get mediaCetak;

  @nullable
  @BuiltValueField(wireName: 'jumlah_cetak')
  int get jumlahCetak;

  @nullable
  @BuiltValueField(wireName: 'ukuran_cetak')
  String get ukuranCetak;

  @nullable
  @BuiltValueField(wireName: 'image_cetak')
  String get imageCetak;

  @nullable
  @BuiltValueField(wireName: 'deadline_cetak')
  DateTime get deadlineCetak;

  @nullable
  String get kategori;

  @nullable
  DocumentReference get user;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CetakRecordBuilder builder) => builder
    ..judulCetak = ''
    ..mediaCetak = ''
    ..jumlahCetak = 0
    ..ukuranCetak = ''
    ..imageCetak = ''
    ..kategori = ''
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cetak');

  static Stream<CetakRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CetakRecord._();
  factory CetakRecord([void Function(CetakRecordBuilder) updates]) =
      _$CetakRecord;

  static CetakRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createCetakRecordData({
  String judulCetak,
  String mediaCetak,
  int jumlahCetak,
  String ukuranCetak,
  String imageCetak,
  DateTime deadlineCetak,
  String kategori,
  DocumentReference user,
  String status,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        CetakRecord.serializer,
        CetakRecord((c) => c
          ..judulCetak = judulCetak
          ..mediaCetak = mediaCetak
          ..jumlahCetak = jumlahCetak
          ..ukuranCetak = ukuranCetak
          ..imageCetak = imageCetak
          ..deadlineCetak = deadlineCetak
          ..kategori = kategori
          ..user = user
          ..status = status
          ..createdAt = createdAt));
