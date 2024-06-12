import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../../bricks/clean_architecture_feature/__brick__/lib/leaderboard/data/exceptions/exceptions.dart';
import '../models/leaderboard_model.dart';

abstract class LeaderboardRemoteDataSource {
  Future<LeaderboardModel> leaderboard();
}

@Injectable(as: LeaderboardRemoteDataSource)
class LeaderboardRemoteDataSourceImpl implements LeaderboardRemoteDataSource {
  final SupabaseClient supabase;
  LeaderboardRemoteDataSourceImpl({required this.supabase});
  @override
  Future<LeaderboardModel> leaderboard() async {
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
      final data = await supabase
          .from('leaderboards')
          .select()
          .eq('date', formattedDate)
          .single();
      return LeaderboardModel.fromJson(data);
    } on PostgrestException catch (_) {
      throw DatabaseException();
    } catch (error) {
      throw ServerException();
    }
  }
}
