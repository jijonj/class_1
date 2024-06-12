import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import '../../domain/entities/{{feature_name}}_entity.dart';

part '../../../../../../bricks/clean_architecture_feature/__brick__/lib/{{feature_name}}/data/models/{{feature_name}}_model.freezed.dart';
part '../../../../../../bricks/clean_architecture_feature/__brick__/lib/{{feature_name}}/data/models/{{feature_name}}_model.g.dart';

{{feature_name.pascalCase()}}Model {{feature_name}}ModelFromJson(String str) =>
    {{feature_name.pascalCase()}}Model.fromJson(json.decode(str));

String {{feature_name}}ModelToJson({{feature_name.pascalCase()}}Model data) =>
    json.encode(data.toJson());

@freezed
class {{feature_name.pascalCase()}}Model with _${{feature_name.pascalCase()}}Model implements {{feature_name.pascalCase()}}Entity {
  const factory {{feature_name.pascalCase()}}Model({
    required int id,
    required DateTime date,
    required String imageUrl,
    required String content,
  }) = _{{feature_name.pascalCase()}}Model;

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}ModelFromJson(json);
}
