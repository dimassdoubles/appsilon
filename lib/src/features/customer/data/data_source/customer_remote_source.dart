import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CustomerRemoteSource {
  Future<void> addCustomer({required String name, required String phone});
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
    });
  }
}
