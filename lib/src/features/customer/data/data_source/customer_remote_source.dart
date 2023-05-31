import 'dart:developer';

import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CustomerRemoteSource {
  Future<void> addCustomer({required String name, required String phone});
  Future<List<Customer>> getCustomerList({String? keyword});
}

@Injectable(as: CustomerRemoteSource)
class SupabaseCustomerSource implements CustomerRemoteSource {
  final _supabase = Supabase.instance.client;

  @override
  Future<void> addCustomer(
      {required String name, required String phone}) async {
    await _supabase.from('customer').insert({
      'customer_name': name,
      'phone': phone,
      'created_at': Utils.getCurrentEpoch(),
      'updated_at': Utils.getCurrentEpoch(),
    });
  }

  @override
  Future<List<Customer>> getCustomerList({String? keyword}) async {
    log("getCustomerList");

    final data = await _supabase.from('customer').select().or(
        "customer_name.ilike.%${keyword ?? ''}%, phone.ilike.%${keyword ?? ''}%");

    final listMap = List<Map<String, dynamic>>.from(data);

    final result = listMap
        .map(
          (e) => Customer.fromJson(e),
        )
        .toList();

    log(result.toString());
    return result;
  }
}
