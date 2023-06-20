import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:appsilon/src/features/order/presentation/blocs/parfume_bloc.dart';
import 'package:appsilon/src/features/order/presentation/blocs/parfume_event.dart';
import 'package:appsilon/src/features/order/presentation/blocs/parfume_state.dart';
import 'package:appsilon/src/features/order/presentation/cubits/service_order_cubit.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownParfume extends StatefulWidget {
  const DropDownParfume({
    super.key,
  });

  @override
  State<DropDownParfume> createState() => _DropDownParfumeState();
}

class _DropDownParfumeState extends State<DropDownParfume> {
  Parfume? _value;

  final ParfumeBloc _parfumeBloc = getIt.get<ParfumeBloc>();
  final _serviceOrderCubit = getIt.get<ServiceOrderCubit>();

  List<DropdownMenuItem<Parfume>> _items = [
    DropdownMenuItem(
      value: null,
      child: Text(
        'Pilih Pewangi',
        style: AppText.semiBold16.copyWith(color: AppColor.black),
      ),
    )
  ];

  @override
  void initState() {
    _parfumeBloc.add(EvGetParfumeList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StyledContainer(
      child: BlocConsumer(
          listener: (context, state) {
            if (state is SuccessGetParfumeList) {
              setState(() {
                _items = [
                  ..._items,
                  ...state.parfumeList.map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.parfumeName,
                          style: AppText.semiBold16
                              .copyWith(color: AppColor.black),
                        ),
                      ))
                ];
              });
            }
          },
          bloc: _parfumeBloc,
          builder: (context, state) => DropdownButton<Parfume>(
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                  _serviceOrderCubit.setParfume(value);
                },
                onTap: () {
                  if (_parfumeBloc.state is! SuccessGetParfumeList) {
                    _parfumeBloc.add(EvGetParfumeList());
                  }
                },
                isExpanded: true,
                underline: const SizedBox(),
                items: _items,
              )),
    );
  }
}
