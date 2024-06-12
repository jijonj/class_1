part of '{{feature_name}}_bloc.dart';

@freezed
class {{feature_name.pascalCase()}}State with _${{feature_name.pascalCase()}}State {
  const factory {{feature_name.pascalCase()}}State.initial() = _Initial;
  const factory {{feature_name.pascalCase()}}State.loadInProgress() = _LoadInProgress;
  const factory {{feature_name.pascalCase()}}State.loadSuccess({{feature_name.pascalCase()}}Entity {{feature_name}}) = _LoadSuccess;
  const factory {{feature_name.pascalCase()}}State.loadFailure(String message) = _LoadFailure;
}
