import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class VersionModel {
  @HiveField(0)
  String version;

  VersionModel({required this.version});
}
