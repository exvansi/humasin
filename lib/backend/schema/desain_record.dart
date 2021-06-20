import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'desain_record.g.dart';

abstract class DesainRecord
    implements Built<DesainRecord, DesainRecordBuilder> {
  static Serializer<DesainRecord> get serializer => _$desainRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'judul_desain')
  String get judulDesain;

  @nullable
  @BuiltValueField(wireName: 'jenis_desain')
  String get jenisDesain;

  @nullable
  @BuiltValueField(wireName: 'keterangan_desain')
  String get keteranganDesain;

  @nullable
  @BuiltValueField(wireName: 'deadline_desain')
  DateTime get deadlineDesain;

  @nullable
  String get kategori;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DesainRecordBuilder builder) => builder
    ..judulDesain = ''
    ..jenisDesain = ''
    ..keteranganDesain = ''
    ..kategori = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('desain');

  static Stream<DesainRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DesainRecord._();
  factory DesainRecord([void Function(DesainRecordBuilder) updates]) =
      _$DesainRecord;

  static DesainRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createDesainRecordData({
  String judulDesain,
  String jenisDesain,
  String keteranganDesain,
  DateTime deadlineDesain,
  String kategori,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        DesainRecord.serializer,
        DesainRecord((d) => d
          ..judulDesain = judulDesain
          ..jenisDesain = jenisDesain
          ..keteranganDesain = keteranganDesain
          ..deadlineDesain = deadlineDesain
          ..kategori = kategori
          ..user = user));

DesainRecord get dummyDesainRecord {
  final builder = DesainRecordBuilder()
    ..judulDesain = dummyString
    ..jenisDesain = dummyString
    ..keteranganDesain = dummyString
    ..deadlineDesain = dummyTimestamp
    ..kategori = dummyString;
  return builder.build();
}

List<DesainRecord> createDummyDesainRecord({int count}) =>
    List.generate(count, (_) => dummyDesainRecord);
