import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'media_promosi_record.g.dart';

abstract class MediaPromosiRecord
    implements Built<MediaPromosiRecord, MediaPromosiRecordBuilder> {
  static Serializer<MediaPromosiRecord> get serializer =>
      _$mediaPromosiRecordSerializer;

  @nullable
  BuiltList<String> get media;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MediaPromosiRecordBuilder builder) =>
      builder..media = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('media_promosi');

  static Stream<MediaPromosiRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MediaPromosiRecord._();
  factory MediaPromosiRecord(
          [void Function(MediaPromosiRecordBuilder) updates]) =
      _$MediaPromosiRecord;

  static MediaPromosiRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createMediaPromosiRecordData() => serializers.toFirestore(
    MediaPromosiRecord.serializer, MediaPromosiRecord((m) => m..media = null));
