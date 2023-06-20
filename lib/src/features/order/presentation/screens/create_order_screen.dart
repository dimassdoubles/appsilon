import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/order/domain/models/service_order.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_bloc.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_event.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_state.dart';
import 'package:appsilon/src/features/order/presentation/cubits/service_order_cubit.dart';
import 'package:appsilon/src/features/order/presentation/widgets/drop_down_parfume.dart';
import 'package:appsilon/src/features/order/presentation/widgets/input_customer.dart';
import 'package:appsilon/src/features/order/presentation/widgets/input_kiloan.dart';
import 'package:appsilon/src/features/order/presentation/widgets/input_satuan.dart';
import 'package:appsilon/src/features/order/presentation/widgets/submit_order_button.dart';
import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/end_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/medium_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/regular_space.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final _serviceBloc = getIt.get<ServiceBloc>();
  final _serviceOrderCubit = getIt.get<ServiceOrderCubit>();

  @override
  void initState() {
    _serviceOrderCubit.createOrder();
    _serviceBloc.add(EvGetServiceList('743d4e2d-7608-40d4-b712-193cbbc08fbd'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Pesanan'),
      ),
      extendBody: true,
      bottomNavigationBar: const SubmitOrderButton(),
      body: BlocConsumer(
        listener: (context, state) {
          if (state is ServiceLoading) {
            EasyLoading.show();
          } else if (state is ServiceFail) {
            EasyLoading.showError(state.failure.message);
          } else {
            EasyLoading.dismiss();
          }
        },
        bloc: _serviceBloc,
        builder: (context, state) {
          if (state is SuccessGetServiceList) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.paddingRegular),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pelanggan',
                        style:
                            AppText.semiBold16.copyWith(color: AppColor.grey),
                      ),
                      const RegularSpace(),
                      const InputCustomer(),
                      const MediumSpace(),
                      Text(
                        'Pewangi',
                        style:
                            AppText.semiBold16.copyWith(color: AppColor.grey),
                      ),
                      const RegularSpace(),
                      const DropDownParfume(),
                      const MediumSpace(),
                      Text(
                        'Kiloan',
                        style:
                            AppText.semiBold16.copyWith(color: AppColor.grey),
                      ),
                      const RegularSpace(),
                      const InputKiloan(),
                      const MediumSpace(),
                      Text(
                        'Satuan',
                        style:
                            AppText.semiBold16.copyWith(color: AppColor.grey),
                      ),
                      const RegularSpace(),
                      const InputSatuan(),
                      const EndSpace(),
                    ]),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
