import 'package:appsilon/injection.dart';
import 'package:appsilon/src/constants/app_constants.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_bloc.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_event.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_state.dart';
import 'package:appsilon/src/features/order/presentation/widgets/order_satuan_item.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputSatuan extends StatefulWidget {
  const InputSatuan({
    super.key,
  });

  @override
  State<InputSatuan> createState() => _InputSatuanState();
}

class _InputSatuanState extends State<InputSatuan> {
  final ServiceBloc _serviceBloc = getIt.get<ServiceBloc>();

  List<Service> _serviceList = [];

  @override
  void initState() {
    _serviceBloc.add(EvGetServiceList(AppConstants.codeCuciSatuan));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _serviceBloc,
      listener: (context, state) {
        if (state is SuccessGetServiceList) {
          setState(() {
            _serviceList = state.serviceList;
          });
        }
      },
      child: StyledContainer(
        width: double.infinity,
        child: Column(
          children: ListTile.divideTiles(
                  context: context,
                  tiles: _serviceList
                      .map((e) => OrderSatuanItem(service: e))
                      .toList())
              .toList(),
        ),
      ),
    );
  }
}
