import 'dart:developer';

import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ParfumeRemoteSource {
  Future<List<Parfume>> getParfumeList();
}

@Injectable(as: ParfumeRemoteSource)
class SupabaseParfumeSource implements ParfumeRemoteSource {
  final _supabase = Supabase.instance.client;

  @override
  Future<List<Parfume>> getParfumeList() async {
    log("supabaseparfumesource getListParfume");

    final data = await _supabase.from('parfume').select();

    final listMap = List<Map<String, dynamic>>.from(data);

    final result = listMap
        .map(
          (e) => Parfume.fromJson(e),
        )
        .toList();

    log(result.toString());
    return result;
  }
}
