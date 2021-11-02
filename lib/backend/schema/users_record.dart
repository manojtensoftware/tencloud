import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'store_code')
  String get storeCode;

  @nullable
  @BuiltValueField(wireName: 'is_mandatory_ok')
  bool get isMandatoryOk;

  @nullable
  @BuiltValueField(wireName: 'data_path')
  String get dataPath;

  @nullable
  @BuiltValueField(wireName: 'firm_name')
  String get firmName;

  @nullable
  @BuiltValueField(wireName: 'selected_city')
  int get selectedCity;

  @nullable
  @BuiltValueField(wireName: 'selected_city_name')
  String get selectedCityName;

  @nullable
  @BuiltValueField(wireName: 'Selected_party_name')
  String get selectedPartyName;

  @nullable
  @BuiltValueField(wireName: 'selected_party_id')
  int get selectedPartyId;

  @nullable
  @BuiltValueField(wireName: 'selected_company')
  int get selectedCompany;

  @nullable
  @BuiltValueField(wireName: 'selected_company_name')
  String get selectedCompanyName;

  @nullable
  @BuiltValueField(wireName: 'from_date')
  DateTime get fromDate;

  @nullable
  @BuiltValueField(wireName: 'to_date')
  DateTime get toDate;

  @nullable
  @BuiltValueField(wireName: 'is_verified')
  bool get isVerified;

  @nullable
  int get dataid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..storeCode = ''
    ..isMandatoryOk = false
    ..dataPath = ''
    ..firmName = ''
    ..selectedCity = 0
    ..selectedCityName = ''
    ..selectedPartyName = ''
    ..selectedPartyId = 0
    ..selectedCompany = 0
    ..selectedCompanyName = ''
    ..isVerified = false
    ..dataid = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String storeCode,
  bool isMandatoryOk,
  String dataPath,
  String firmName,
  int selectedCity,
  String selectedCityName,
  String selectedPartyName,
  int selectedPartyId,
  int selectedCompany,
  String selectedCompanyName,
  DateTime fromDate,
  DateTime toDate,
  bool isVerified,
  int dataid,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..storeCode = storeCode
          ..isMandatoryOk = isMandatoryOk
          ..dataPath = dataPath
          ..firmName = firmName
          ..selectedCity = selectedCity
          ..selectedCityName = selectedCityName
          ..selectedPartyName = selectedPartyName
          ..selectedPartyId = selectedPartyId
          ..selectedCompany = selectedCompany
          ..selectedCompanyName = selectedCompanyName
          ..fromDate = fromDate
          ..toDate = toDate
          ..isVerified = isVerified
          ..dataid = dataid));
