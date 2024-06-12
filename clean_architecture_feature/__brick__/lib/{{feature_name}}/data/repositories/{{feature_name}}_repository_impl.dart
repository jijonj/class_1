import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/{{feature_name}}_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/{{feature_name}}_repository.dart';
import '../datasources/{{feature_name}}_remote_data_source.dart';

@Injectable(as: {{feature_name.pascalCase()}}Repository)
class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource remoteDataSource;

  {{feature_name.pascalCase()}}RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, {{feature_name.pascalCase()}}Entity>> {{feature_name}}() async {
    try {
      final {{feature_name}}Model = await remoteDataSource.{{feature_name}}();
      return Right({{feature_name}}Model);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
