import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'studio_record.g.dart';

abstract class StudioRecord
    implements Built<StudioRecord, StudioRecordBuilder> {
  static Serializer<StudioRecord> get serializer => _$studioRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'judul_studio')
  String get judulStudio;

  @nullable
  @BuiltValueField(wireName: 'jenis_studio')
  String get jenisStudio;

  @nullable
  @BuiltValueField(wireName: 'jumlah_orang')
  int get jumlahOrang;

  @nullable
  @BuiltValueField(wireName: 'waktu_studio')
  DateTime get waktuStudio;

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

  static void _initializeBuilder(StudioRecordBuilder builder) => builder
    ..judulStudio = ''
    ..jenisStudio = ''
    ..jumlahOrang = 0
    ..kategori = ''
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('studio');

  static Stream<StudioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StudioRecord._();
  factory StudioRecord([void Function(StudioRecordBuilder) updates]) =
      _$StudioRecord;

  static StudioRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createStudioRecordData({
  String judulStudio,
  String jenisStudio,
  int jumlahOrang,
  DateTime waktuStudio,
  String kategori,
  DocumentReference user,
  String status,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        StudioRecord.serializer,
        StudioRecord((s) => s
          ..judulStudio = judulStudio
          ..jenisStudio = jenisStudio
          ..jumlahOrang = jumlahOrang
          ..waktuStudio = waktuStudio
          ..kategori = kategori
          ..user = user
          ..status = status
          ..createdAt = createdAt));
