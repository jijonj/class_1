import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../../bricks/clean_architecture_feature/__brick__/lib/{{feature_name}}/data/exceptions/exceptions.dart';
import '../models/{{feature_name}}_model.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource {
  Future<{{feature_name.pascalCase()}}Model> {{feature_name}}();
}

@Injectable(as: {{feature_name.pascalCase()}}RemoteDataSource)
class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}RemoteDataSource {
  final SupabaseClient supabase;
  {{feature_name.pascalCase()}}RemoteDataSourceImpl({required this.supabase});
  @override
  Future<{{feature_name.pascalCase()}}Model> {{feature_name}}() async {
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
      final data = await supabase
          .from('{{feature_name}}s')
          .select()
          .eq('date', formattedDate)
          .single();
      return {{feature_name.pascalCase()}}Model.fromJson(data);
    } on PostgrestException catch (_) {
      throw DatabaseException();
    } catch (error) {
      throw ServerException();
    }
  }
}
