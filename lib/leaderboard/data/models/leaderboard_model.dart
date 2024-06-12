import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import '../../domain/entities/leaderboard_entity.dart';

part '../../../../../../bricks/clean_architecture_feature/__brick__/lib/leaderboard/data/models/leaderboard_model.freezed.dart';
part '../../../../../../bricks/clean_architecture_feature/__brick__/lib/leaderboard/data/models/leaderboard_model.g.dart';

LeaderboardModel leaderboardModelFromJson(String str) =>
    LeaderboardModel.fromJson(json.decode(str));

String leaderboardModelToJson(LeaderboardModel data) =>
    json.encode(data.toJson());

@freezed
class LeaderboardModel with _$LeaderboardModel implements LeaderboardEntity {
  const factory LeaderboardModel({
    required int id,
    required DateTime date,
    required String imageUrl,
    required String content,
  }) = _LeaderboardModel;

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardModelFromJson(json);
}
