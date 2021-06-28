import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jenis_desain_record.g.dart';

abstract class JenisDesainRecord
    implements Built<JenisDesainRecord, JenisDesainRecordBuilder> {
  static Serializer<JenisDesainRecord> get serializer =>
      _$jenisDesainRecordSerializer;

  @nullable
  BuiltList<String> get jenis;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(JenisDesainRecordBuilder builder) =>
      builder..jenis = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jenis_desain');

  static Stream<JenisDesainRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  JenisDesainRecord._();
  factory JenisDesainRecord([void Function(JenisDesainRecordBuilder) updates]) =
      _$JenisDesainRecord;

  static JenisDesainRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createJenisDesainRecordData() => serializers.toFirestore(
    JenisDesainRecord.serializer, JenisDesainRecord((j) => j..jenis = null));
