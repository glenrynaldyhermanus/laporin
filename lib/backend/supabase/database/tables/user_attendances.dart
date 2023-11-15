import '../database.dart';

class UserAttendancesTable extends SupabaseTable<UserAttendancesRow> {
  @override
  String get tableName => 'user_attendances';

  @override
  UserAttendancesRow createRow(Map<String, dynamic> data) =>
      UserAttendancesRow(data);
}

class UserAttendancesRow extends SupabaseDataRow {
  UserAttendancesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserAttendancesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  DateTime? get clockedInAt => getField<DateTime>('clocked_in_at');
  set clockedInAt(DateTime? value) =>
      setField<DateTime>('clocked_in_at', value);

  DateTime? get clockedOutAt => getField<DateTime>('clocked_out_at');
  set clockedOutAt(DateTime? value) =>
      setField<DateTime>('clocked_out_at', value);

  String? get picturedIn => getField<String>('pictured_in');
  set picturedIn(String? value) => setField<String>('pictured_in', value);

  String? get picturedOut => getField<String>('pictured_out');
  set picturedOut(String? value) => setField<String>('pictured_out', value);

  double? get geoLatitudeIn => getField<double>('geo_latitude_in');
  set geoLatitudeIn(double? value) =>
      setField<double>('geo_latitude_in', value);

  double? get geoLongitudeIn => getField<double>('geo_longitude_in');
  set geoLongitudeIn(double? value) =>
      setField<double>('geo_longitude_in', value);

  double? get geoLatitudeOut => getField<double>('geo_latitude_out');
  set geoLatitudeOut(double? value) =>
      setField<double>('geo_latitude_out', value);

  double? get geoLongitudeOut => getField<double>('geo_longitude_out');
  set geoLongitudeOut(double? value) =>
      setField<double>('geo_longitude_out', value);
}
