import 'package:appsilon/src/features/customer/domain/usecases/add_customer.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_event.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final AddCustomer _addCustomer;

  CustomerBloc({required AddCustomer addCustomer})
      : _addCustomer = addCustomer,
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
  }
}
