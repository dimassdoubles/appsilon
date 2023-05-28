import 'package:appsilon/src/features/order/domain/usecases/get_service_list.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_event.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetServiceList _getServiceList;

  ServiceBloc({required GetServiceList getServiceList})
      : _getServiceList = getServiceList,
        super(ServiceInit()) {
    on<EvGetServiceList>((event, emit) async {
      emit(ServiceLoading());

      final result = await _getServiceList(subCtgrCode: event.subCtgrCode);

      result.fold((l) {
        emit(ServiceFail(l));
      }, (r) {
        emit(SuccessGetServiceList(r));
      });
    });
  }
}
