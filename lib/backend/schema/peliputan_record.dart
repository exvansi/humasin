import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

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
  bool get publikasiPeliputan;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PeliputanRecordBuilder builder) => builder
    ..judulPeliputan = ''
    ..tempatPeliputan = ''
    ..kategori = ''
    ..status = ''
    ..publikasiPeliputan = false;

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
  bool publikasiPeliputan,
  DateTime createdAt,
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
          ..publikasiPeliputan = publikasiPeliputan
          ..createdAt = createdAt));
