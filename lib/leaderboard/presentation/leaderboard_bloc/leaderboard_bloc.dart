import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/leaderboard_entity.dart';
import '../../domain/usecases/leaderboard_use_case.dart';
import '../../core/utils/common_utils.dart';

part 'leaderboard_state.dart';
part 'leaderboard_event.dart';
part '../../../../../../bricks/clean_architecture_feature/__brick__/lib/leaderboard/presentation/leaderboard_bloc/leaderboard_bloc.freezed.dart';

@injectable
class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final LeaderboardUseCase _leaderboardUseCase;
  LeaderboardBloc(this._leaderboardUseCase)
      : super(const LeaderboardState.initial()) {
    on<LeaderboardEvent>((event, emit) async {
      await event.when(
        getLeaderboard: () async {
          emit(const _LoadInProgress());
          final failureOrLeaderboard = await _leaderboardUseCase();
          failureOrLeaderboard.fold(
              (failure) => emit(_LoadFailure(mapFailureToMessage(failure))),
              (leaderboard) => emit(_LoadSuccess(leaderboard)));
        },
      );
    });
  }
}
