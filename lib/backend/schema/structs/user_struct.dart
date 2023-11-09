// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    int? id,
    String? uuid,
    String? name,
    String? email,
    String? gender,
    DateTime? birthdate,
  })  : _id = id,
        _uuid = uuid,
        _name = name,
        _email = email,
        _gender = gender,
        _birthdate = birthdate;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;
  bool hasUuid() => _uuid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  set birthdate(DateTime? val) => _birthdate = val;
  bool hasBirthdate() => _birthdate != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: castToType<int>(data['id']),
        uuid: data['uuid'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        gender: data['gender'] as String?,
        birthdate: data['birthdate'] as DateTime?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'uuid': _uuid,
        'name': _name,
        'email': _email,
        'gender': _gender,
        'birthdate': _birthdate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'birthdate': serializeParam(
          _birthdate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        birthdate: deserializeParam(
          data['birthdate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        id == other.id &&
        uuid == other.uuid &&
        name == other.name &&
        email == other.email &&
        gender == other.gender &&
        birthdate == other.birthdate;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, uuid, name, email, gender, birthdate]);
}

UserStruct createUserStruct({
  int? id,
  String? uuid,
  String? name,
  String? email,
  String? gender,
  DateTime? birthdate,
}) =>
    UserStruct(
      id: id,
      uuid: uuid,
      name: name,
      email: email,
      gender: gender,
      birthdate: birthdate,
    );
