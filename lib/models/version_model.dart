import 'package:hive/hive.dart';

part 'version_model.g.dart';

@HiveType(typeId: 1)
class VersionModel {
  @HiveField(0)
  String version;

  VersionModel({required this.version});
}
