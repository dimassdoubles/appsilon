import 'dart:developer' hide Service;

import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ServiceRemoteSource {
  Future<List<Service>> getServiceList({required String subCtgrCode});
}

@Injectable(as: ServiceRemoteSource)
class SupabaseServiceSource implements ServiceRemoteSource {
  final _supabase = Supabase.instance.client;

  @override
  Future<List<Service>> getServiceList({required String subCtgrCode}) async {
    log("getServiceList source");
    final data = await _supabase
        .from('service')
        .select('*, sub_ctgr(sub_ctgr_code)')
        .eq('sub_ctgr.sub_ctgr_code', subCtgrCode);

    log(data.toString());

    final listMap = List<Map<String, dynamic>>.from(data);

    final result = listMap
        .map(
          (e) => Service.fromJson(e),
        )
        .toList();

    return result;
  }
}
