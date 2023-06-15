import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';

class ServiceOrder {
  Customer? customer;
  Parfume? parfume;
  Map<Service, int> services;
  String? note;

  ServiceOrder({
    this.customer,
    this.parfume,
    this.note,
    required this.services,
  });
}
