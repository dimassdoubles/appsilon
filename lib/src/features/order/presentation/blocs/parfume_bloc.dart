import 'package:appsilon/src/features/order/domain/usecases/get_parfume_list.dart';
import 'package:appsilon/src/features/order/presentation/blocs/parfume_event.dart';
import 'package:appsilon/src/features/order/presentation/blocs/parfume_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ParfumeBloc extends Bloc<ParfumeEvent, ParfumeState> {
  final GetParfumeList _getParfumeList;

  ParfumeBloc({required GetParfumeList getParfumeList})
      : _getParfumeList = getParfumeList,
        super(ParfumeInit()) {
    on<EvGetParfumeList>(
      (event, emit) async {
        emit(ParfumeLoading());

        final result = await _getParfumeList();

        result.fold((l) {
          emit(ParfumeFail(l));
        }, (r) {
          emit(SuccessGetParfumeList(r));
        });
      },
    );
  }
}
