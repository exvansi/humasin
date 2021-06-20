import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'promosi_record.g.dart';

abstract class PromosiRecord
    implements Built<PromosiRecord, PromosiRecordBuilder> {
  static Serializer<PromosiRecord> get serializer => _$promosiRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'judul_promosi')
  String get judulPromosi;

  @nullable
  @BuiltValueField(wireName: 'media_promosi')
  String get mediaPromosi;

  @nullable
  @BuiltValueField(wireName: 'waktu_tayang_promosi')
  DateTime get waktuTayangPromosi;

  @nullable
  @BuiltValueField(wireName: 'image_promosi')
  String get imagePromosi;

  @nullable
  @BuiltValueField(wireName: 'video_promosi')
  String get videoPromosi;

  @nullable
  String get kategori;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PromosiRecordBuilder builder) => builder
    ..judulPromosi = ''
    ..mediaPromosi = ''
    ..imagePromosi = ''
    ..videoPromosi = ''
    ..kategori = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promosi');

  static Stream<PromosiRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PromosiRecord._();
  factory PromosiRecord([void Function(PromosiRecordBuilder) updates]) =
      _$PromosiRecord;

  static PromosiRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createPromosiRecordData({
  String judulPromosi,
  String mediaPromosi,
  DateTime waktuTayangPromosi,
  String imagePromosi,
  String videoPromosi,
  String kategori,
}) =>
    serializers.toFirestore(
        PromosiRecord.serializer,
        PromosiRecord((p) => p
          ..judulPromosi = judulPromosi
          ..mediaPromosi = mediaPromosi
          ..waktuTayangPromosi = waktuTayangPromosi
          ..imagePromosi = imagePromosi
          ..videoPromosi = videoPromosi
          ..kategori = kategori));

PromosiRecord get dummyPromosiRecord {
  final builder = PromosiRecordBuilder()
    ..judulPromosi = dummyString
    ..mediaPromosi = dummyString
    ..waktuTayangPromosi = dummyTimestamp
    ..imagePromosi = dummyImagePath
    ..videoPromosi = dummyVideoPath
    ..kategori = dummyString;
  return builder.build();
}

List<PromosiRecord> createDummyPromosiRecord({int count}) =>
    List.generate(count, (_) => dummyPromosiRecord);
