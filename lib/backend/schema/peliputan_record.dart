import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'peliputan_record.g.dart';

abstract class PeliputanRecord
    implements Built<PeliputanRecord, PeliputanRecordBuilder> {
  static Serializer<PeliputanRecord> get serializer =>
      _$peliputanRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'judul_peliputan')
  String get judulPeliputan;

  @nullable
  @BuiltValueField(wireName: 'tempat_peliputan')
  String get tempatPeliputan;

  @nullable
  @BuiltValueField(wireName: 'waktu_peliputan')
  DateTime get waktuPeliputan;

  @nullable
  String get kategori;

  @nullable
  DocumentReference get user;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: 'publikasi_peliputan')
  String get publikasiPeliputan;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PeliputanRecordBuilder builder) => builder
    ..judulPeliputan = ''
    ..tempatPeliputan = ''
    ..kategori = ''
    ..status = ''
    ..publikasiPeliputan = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('peliputan');

  static Stream<PeliputanRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PeliputanRecord._();
  factory PeliputanRecord([void Function(PeliputanRecordBuilder) updates]) =
      _$PeliputanRecord;

  static PeliputanRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createPeliputanRecordData({
  String judulPeliputan,
  String tempatPeliputan,
  DateTime waktuPeliputan,
  String kategori,
  DocumentReference user,
  String status,
  String publikasiPeliputan,
}) =>
    serializers.toFirestore(
        PeliputanRecord.serializer,
        PeliputanRecord((p) => p
          ..judulPeliputan = judulPeliputan
          ..tempatPeliputan = tempatPeliputan
          ..waktuPeliputan = waktuPeliputan
          ..kategori = kategori
          ..user = user
          ..status = status
          ..publikasiPeliputan = publikasiPeliputan));

PeliputanRecord get dummyPeliputanRecord {
  final builder = PeliputanRecordBuilder()
    ..judulPeliputan = dummyString
    ..tempatPeliputan = dummyString
    ..waktuPeliputan = dummyTimestamp
    ..kategori = dummyString
    ..status = dummyString
    ..publikasiPeliputan = dummyString;
  return builder.build();
}

List<PeliputanRecord> createDummyPeliputanRecord({int count}) =>
    List.generate(count, (_) => dummyPeliputanRecord);
