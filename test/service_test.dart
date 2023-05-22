import 'dart:developer';

import 'package:appsilon/src/features/order/domain/models/service.dart';

void main() {
  List<Map<String, dynamic>> listku;

  listku = List<Map<String, dynamic>>.from([]);

  try {
    listku.map(
      (e) => Service.fromJson(e),
    );
  } catch (e) {
    log(e.toString());
  }
}
