import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get password;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..name = ''
    ..email = ''
    ..photoUrl = ''
    ..password = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;
}

Map<String, dynamic> createUsersRecordData({
  String name,
  String email,
  String photoUrl,
  String password,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..name = name
          ..email = email
          ..photoUrl = photoUrl
          ..password = password));

UsersRecord get dummyUsersRecord {
  final builder = UsersRecordBuilder()
    ..name = dummyString
    ..email = dummyString
    ..photoUrl = dummyImagePath
    ..password = dummyString;
  return builder.build();
}

List<UsersRecord> createDummyUsersRecord({int count}) =>
    List.generate(count, (_) => dummyUsersRecord);
