import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'kunjungan_record.g.dart';

abstract class KunjunganRecord
    implements Built<KunjunganRecord, KunjunganRecordBuilder> {
  static Serializer<KunjunganRecord> get serializer =>
      _$kunjunganRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'waktu_kunjungan')
  DateTime get waktuKunjungan;

  @nullable
  @BuiltValueField(wireName: 'nama_lengkap')
  String get namaLengkap;

  @nullable
  @BuiltValueField(wireName: 'asal_instansi')
  String get asalInstansi;

  @nullable
  String get keperluan;

  @nullable
  @BuiltValueField(wireName: 'no_hp')
  String get noHp;

  @nullable
  String get kategori;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(KunjunganRecordBuilder builder) => builder
    ..namaLengkap = ''
    ..asalInstansi = ''
    ..keperluan = ''
    ..noHp = ''
    ..kategori = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kunjungan');

  static Stream<KunjunganRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  KunjunganRecord._();
  factory KunjunganRecord([void Function(KunjunganRecordBuilder) updates]) =
      _$KunjunganRecord;

  static KunjunganRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createKunjunganRecordData({
  DateTime waktuKunjungan,
  String namaLengkap,
  String asalInstansi,
  String keperluan,
  String noHp,
  String kategori,
  DocumentReference user,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        KunjunganRecord.serializer,
        KunjunganRecord((k) => k
          ..waktuKunjungan = waktuKunjungan
          ..namaLengkap = namaLengkap
          ..asalInstansi = asalInstansi
          ..keperluan = keperluan
          ..noHp = noHp
          ..kategori = kategori
          ..user = user
          ..createdAt = createdAt));
