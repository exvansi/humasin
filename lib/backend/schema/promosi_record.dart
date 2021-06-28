import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

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
  DocumentReference get user;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PromosiRecordBuilder builder) => builder
    ..judulPromosi = ''
    ..mediaPromosi = ''
    ..imagePromosi = ''
    ..videoPromosi = ''
    ..kategori = ''
    ..status = '';

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
  DocumentReference user,
  String status,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        PromosiRecord.serializer,
        PromosiRecord((p) => p
          ..judulPromosi = judulPromosi
          ..mediaPromosi = mediaPromosi
          ..waktuTayangPromosi = waktuTayangPromosi
          ..imagePromosi = imagePromosi
          ..videoPromosi = videoPromosi
          ..kategori = kategori
          ..user = user
          ..status = status
          ..createdAt = createdAt));
