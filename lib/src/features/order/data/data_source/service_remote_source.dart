import 'dart:developer' hide Service;

import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ServiceRemoteSource {
  Future<List<Service>> getServiceList({required String subCtgrId});
}

@Injectable(as: ServiceRemoteSource)
class SupabaseServiceSource implements ServiceRemoteSource {
  final _supabase = Supabase.instance.client;

  @override
  Future<List<Service>> getServiceList({required String subCtgrId}) async {
    log("getServiceList source");
    final data =
        await _supabase.from('service').select().eq('sub_ctgr_id', subCtgrId);

    final listMap = List<Map<String, dynamic>>.from(data);

    final result = listMap
        .map(
          (e) => Service.fromJson(e),
        )
        .toList();

    return result;
  }
}
