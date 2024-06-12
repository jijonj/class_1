import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../failures/failures.dart';
import '../repositories/leaderboard_repository.dart';
import '../entities/leaderboard_entity.dart';

@injectable
class LeaderboardUseCase {
  final LeaderboardRepository leaderboardRepository;

  LeaderboardUseCase({required this.leaderboardRepository});

  Future<Either<Failure, LeaderboardEntity>> call() async {
    return await leaderboardRepository.leaderboard();
  }
}
