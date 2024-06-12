import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../failures/failures.dart';
import '../repositories/{{feature_name}}_repository.dart';
import '../entities/{{feature_name}}_entity.dart';

@injectable
class {{feature_name.pascalCase()}}UseCase {
  final {{feature_name.pascalCase()}}Repository {{feature_name}}Repository;

  {{feature_name.pascalCase()}}UseCase({required this.{{feature_name}}Repository});

  Future<Either<Failure, {{feature_name.pascalCase()}}Entity>> call() async {
    return await {{feature_name}}Repository.{{feature_name}}();
  }
}
