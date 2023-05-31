import 'package:appsilon/src/features/customer/domain/usecases/add_customer.dart';
import 'package:appsilon/src/features/customer/domain/usecases/get_customer_list.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_event.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final AddCustomer _addCustomer;
  final GetCustomerList _getCustomerList;

  CustomerBloc(
      {required AddCustomer addCustomer,
      required GetCustomerList getCustomerList})
      : _addCustomer = addCustomer,
        _getCustomerList = getCustomerList,
        super(CustomerInit()) {
    on<EvAddCustomer>(
      (event, emit) async {
        emit(CustomerLoading());

        final result = await _addCustomer(name: event.name, phone: event.phone);

        result.fold((l) {
          emit(CustomerFail(failure: l));
        }, (r) {
          emit(SuccessAddCustomer());
        });
      },
    );

    on<EvGetCustomerList>(
      (event, emit) async {
        emit(CustomerLoading());

        final result = await _getCustomerList(keyword: event.keyword);

        result.fold((l) {
          emit(CustomerFail(failure: l));
        }, (r) {
          emit(SuccessGetCustomerList(listCustomer: r));
        });
      },
    );
  }
}
