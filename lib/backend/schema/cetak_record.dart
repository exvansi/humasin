import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

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
          ..status = status));

CetakRecord get dummyCetakRecord {
  final builder = CetakRecordBuilder()
    ..judulCetak = dummyString
    ..mediaCetak = dummyString
    ..jumlahCetak = dummyInteger
    ..ukuranCetak = dummyString
    ..imageCetak = dummyImagePath
    ..deadlineCetak = dummyTimestamp
    ..kategori = dummyString
    ..status = dummyString;
  return builder.build();
}

List<CetakRecord> createDummyCetakRecord({int count}) =>
    List.generate(count, (_) => dummyCetakRecord);
