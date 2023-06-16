import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';

enum PaymentMethod { tunai, nonTunai }

class ServiceOrder {
  Customer? customer;
  Parfume? parfume;
  Map<Service, int> services;
  String? note;
  PaymentMethod? paymentMethod;
  int? paymentAmount;
  int? returnAmount;

  ServiceOrder({
    this.customer,
    this.parfume,
    this.note,
    this.paymentMethod,
    this.paymentAmount,
    this.returnAmount,
    required this.services,
  });
}
