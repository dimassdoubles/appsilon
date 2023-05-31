abstract class CustomerEvent {}

class EvAddCustomer extends CustomerEvent {
  final String name;
  final String phone;

  EvAddCustomer({required this.name, required this.phone});
}

class EvGetCustomerList extends CustomerEvent {
  final String? keyword;

  EvGetCustomerList({this.keyword});
}
