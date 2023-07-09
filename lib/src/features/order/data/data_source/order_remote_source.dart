import 'package:appsilon/src/features/order/domain/models/service_order.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class OrderRemoteSource {
  Future<void> createOrder({required ServiceOrder serviceOrder});
}

@Injectable(as: OrderRemoteSource)
class SupabaseOrderSource implements OrderRemoteSource {
  final _supabase = Supabase.instance.client;

  @override
  Future<void> createOrder({required ServiceOrder serviceOrder}) async {
    await _supabase.from('transaction').insert({
      'transaction_code': serviceOrder.transactionCode,
      'customer_id': serviceOrder,
      'total': serviceOrder,
      'version bigint': 0,
      'created_at': serviceOrder.createDatetime,
      'updated_at': serviceOrder.createDatetime,
    });
  }
}
