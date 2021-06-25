import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'jenis_cetak_record.g.dart';

abstract class JenisCetakRecord
    implements Built<JenisCetakRecord, JenisCetakRecordBuilder> {
  static Serializer<JenisCetakRecord> get serializer =>
      _$jenisCetakRecordSerializer;

  @nullable
  BuiltList<String> get jenis;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(JenisCetakRecordBuilder builder) =>
      builder..jenis = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jenis_cetak');

  static Stream<JenisCetakRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  JenisCetakRecord._();
  factory JenisCetakRecord([void Function(JenisCetakRecordBuilder) updates]) =
      _$JenisCetakRecord;

  static JenisCetakRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createJenisCetakRecordData() => serializers.toFirestore(
    JenisCetakRecord.serializer, JenisCetakRecord((j) => j..jenis = null));

JenisCetakRecord get dummyJenisCetakRecord {
  final builder = JenisCetakRecordBuilder()
    ..jenis = ListBuilder([dummyString, dummyString]);
  return builder.build();
}

List<JenisCetakRecord> createDummyJenisCetakRecord({int count}) =>
    List.generate(count, (_) => dummyJenisCetakRecord);
