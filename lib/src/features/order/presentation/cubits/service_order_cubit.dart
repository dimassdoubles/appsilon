import 'dart:developer';

import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/features/order/domain/models/service_order.dart';
import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ServiceOrderCubit extends Cubit<ServiceOrder?> {
  ServiceOrderCubit() : super(null);

  void _reset() {
    emit(null);
  }

  void createOrder() {
    log("buat order");
    _reset();
    emit(ServiceOrder(services: {}));
  }

  void setPaymentAmount(int paymentAmount) {
    state!.paymentAmount = paymentAmount;

    final services = state!.services;
    final keys = services.keys;

    int total = 0;

    for (var key in keys) {
      total += services[key]! * key.price;
    }

    if (paymentAmount == 0) {
      state!.paymentAmount = null;
      state!.returnAmount = null;
    } else {
      state!.paymentAmount = paymentAmount;
      state!.returnAmount = paymentAmount - total;
    }

    final newState = ServiceOrder(
        services: state!.services,
        customer: state!.customer,
        note: state!.note,
        parfume: state!.parfume,
        paymentAmount: state!.paymentAmount,
        paymentMethod: state!.paymentMethod,
        returnAmount: state!.returnAmount);
    emit(newState);
  }

  void setPaymentMethod(PaymentMethod? paymentMethod) {
    state!.paymentMethod = paymentMethod;
    log(state!.customer.toString());

    final newState = ServiceOrder(
        services: state!.services,
        customer: state!.customer,
        note: state!.note,
        parfume: state!.parfume,
        paymentAmount: state!.paymentAmount,
        paymentMethod: state!.paymentMethod,
        returnAmount: state!.returnAmount);
    emit(newState);
  }

  void setCustomer(Customer? customer) {
    if (state == null) {
      createOrder();
    }
    state!.customer = customer;
    log(state!.customer.toString());
    final newState = ServiceOrder(
        services: state!.services,
        customer: state!.customer,
        note: state!.note,
        parfume: state!.parfume,
        paymentAmount: state!.paymentAmount,
        paymentMethod: state!.paymentMethod,
        returnAmount: state!.returnAmount);
    emit(newState);
  }

  void setParfume(Parfume? parfume) {
    if (state == null) {
      createOrder();
    }
    state!.parfume = parfume;

    final newState = ServiceOrder(
        services: state!.services,
        customer: state!.customer,
        note: state!.note,
        parfume: state!.parfume,
        paymentAmount: state!.paymentAmount,
        paymentMethod: state!.paymentMethod,
        returnAmount: state!.returnAmount);
    emit(newState);
  }

  void setService(Service service, int amount) {
    if (state == null) {
      createOrder();
    }
    state!.services[service] = amount;

    if (amount == 0) {
      state!.services.remove(service);
    }

    final newState = ServiceOrder(
        services: state!.services,
        customer: state!.customer,
        note: state!.note,
        parfume: state!.parfume,
        paymentAmount: state!.paymentAmount,
        paymentMethod: state!.paymentMethod,
        returnAmount: state!.returnAmount);
    emit(newState);
  }
}
