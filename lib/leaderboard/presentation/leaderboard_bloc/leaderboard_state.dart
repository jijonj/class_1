part of 'leaderboard_bloc.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState.initial() = _Initial;
  const factory LeaderboardState.loadInProgress() = _LoadInProgress;
  const factory LeaderboardState.loadSuccess(LeaderboardEntity leaderboard) = _LoadSuccess;
  const factory LeaderboardState.loadFailure(String message) = _LoadFailure;
}
