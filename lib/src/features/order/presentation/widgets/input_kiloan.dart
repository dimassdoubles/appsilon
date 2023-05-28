import 'dart:developer';

import 'package:appsilon/injection.dart';
import 'package:appsilon/src/constants/app_constants.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_bloc.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_event.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_state.dart';
import 'package:appsilon/src/shared/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class InputKiloan extends StatefulWidget {
  const InputKiloan({
    super.key,
  });

  @override
  State<InputKiloan> createState() => _InputKiloanState();
}

class _InputKiloanState extends State<InputKiloan> {
  int _qty = 0;

  final ServiceBloc _serviceBloc = getIt.get<ServiceBloc>();

  Service? _selected;
  List<Service> _serviceList = [];

  @override
  void initState() {
    _serviceBloc.add(EvGetServiceList(AppConstants.codeCuciKiloan));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _serviceBloc,
        listener: (context, state) {
          if (state is SuccessGetServiceList) {
            log("rebuild lagi");
            setState(() {
              _serviceList = state.serviceList;
            });
          }
        },
        child: StyledContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<Service>(
                value: _selected,
                style: AppText.semiBold16.copyWith(color: AppColor.black),
                underline: const SizedBox(),
                items: _serviceList
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.serviceName,
                          style: AppText.semiBold16
                              .copyWith(color: AppColor.black),
                        )))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selected = value;
                  });
                },
              ),
              const MiniSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rp ${_selected?.price ?? '-'} / kg"),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.lightGrey,
                            borderRadius: BorderRadius.circular(
                                AppSize.borderRadiusRegular)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_qty > 0) {
                                      _qty -= 1;
                                    }
                                  });
                                },
                                icon:
                                    SvgPicture.asset('assets/icons/minus.svg')),
                            const MiniSpace(orientation: Orientation.landscape),
                            Text('$_qty', style: AppText.semiBold16),
                            const MiniSpace(orientation: Orientation.landscape),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _qty += 1;
                                  });
                                },
                                icon: SvgPicture.asset('assets/icons/plus.svg'))
                          ],
                        ),
                      ),
                      const RegularSpace(
                        orientation: Orientation.landscape,
                      ),
                      const Text('Kg')
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
