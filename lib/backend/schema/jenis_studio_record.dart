import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jenis_studio_record.g.dart';

abstract class JenisStudioRecord
    implements Built<JenisStudioRecord, JenisStudioRecordBuilder> {
  static Serializer<JenisStudioRecord> get serializer =>
      _$jenisStudioRecordSerializer;

  @nullable
  BuiltList<String> get jenis;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(JenisStudioRecordBuilder builder) =>
      builder..jenis = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jenis_studio');

  static Stream<JenisStudioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  JenisStudioRecord._();
  factory JenisStudioRecord([void Function(JenisStudioRecordBuilder) updates]) =
      _$JenisStudioRecord;

  static JenisStudioRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createJenisStudioRecordData() => serializers.toFirestore(
    JenisStudioRecord.serializer, JenisStudioRecord((j) => j..jenis = null));
