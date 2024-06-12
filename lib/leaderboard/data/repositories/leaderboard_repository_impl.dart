import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/leaderboard_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/leaderboard_repository.dart';
import '../datasources/leaderboard_remote_data_source.dart';

@Injectable(as: LeaderboardRepository)
class LeaderboardRepositoryImpl implements LeaderboardRepository {
  final LeaderboardRemoteDataSource remoteDataSource;

  LeaderboardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, LeaderboardEntity>> leaderboard() async {
    try {
      final leaderboardModel = await remoteDataSource.leaderboard();
      return Right(leaderboardModel);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
