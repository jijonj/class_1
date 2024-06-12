import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/{{feature_name}}_entity.dart';
import '../../domain/usecases/{{feature_name}}_use_case.dart';
import '../../core/utils/common_utils.dart';

part '{{feature_name}}_state.dart';
part '{{feature_name}}_event.dart';
part '../../../../../../bricks/clean_architecture_feature/__brick__/lib/{{feature_name}}/presentation/{{feature_name}}_bloc/{{feature_name}}_bloc.freezed.dart';

@injectable
class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  final {{feature_name.pascalCase()}}UseCase _{{feature_name}}UseCase;
  {{feature_name.pascalCase()}}Bloc(this._{{feature_name}}UseCase)
      : super(const {{feature_name.pascalCase()}}State.initial()) {
    on<{{feature_name.pascalCase()}}Event>((event, emit) async {
      await event.when(
        get{{feature_name.pascalCase()}}: () async {
          emit(const _LoadInProgress());
          final failureOr{{feature_name.pascalCase()}} = await _{{feature_name}}UseCase();
          failureOr{{feature_name.pascalCase()}}.fold(
              (failure) => emit(_LoadFailure(mapFailureToMessage(failure))),
              ({{feature_name}}) => emit(_LoadSuccess({{feature_name}})));
        },
      );
    });
  }
}
