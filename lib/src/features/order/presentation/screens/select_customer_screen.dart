import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_bloc.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_event.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_state.dart';
import 'package:appsilon/src/features/order/presentation/widgets/select_customer_card.dart';
import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/end_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_text_form_field.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SelectCustomerScreen extends StatefulWidget {
  const SelectCustomerScreen({super.key});

  @override
  State<SelectCustomerScreen> createState() => _SelectCustomerScreenState();
}

class _SelectCustomerScreenState extends State<SelectCustomerScreen> {
  final CustomerBloc _customerBloc = getIt.get<CustomerBloc>();

  final TextEditingController _keywordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    _customerBloc.add(EvGetCustomerList());
  }

  @override
  void dispose() {
    _keywordCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pelanggan')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const AddCustomerRoute());
        },
        backgroundColor: AppColor.lightBlue,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
            child: StyledTextFormField(
              controller: _keywordCtrl,
              onFieldSubmitted: (value) {
                _customerBloc.add(EvGetCustomerList(keyword: value));
              },
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: AppSize.paddingRegular),
                child: IconButton(
                    onPressed: () {
                      final keyword = _keywordCtrl.text;
                      _customerBloc.add(EvGetCustomerList(keyword: keyword));
                    },
                    icon: SvgPicture.asset('assets/icons/search.svg')),
              ),
            ),
          ),
          const RegularSpace(),
          Expanded(
            child: SingleChildScrollView(
              child: BlocConsumer(
                  bloc: _customerBloc,
                  listener: (context, state) {
                    if (state is CustomerLoading) {
                      EasyLoading.show();
                    } else if (state is CustomerFail) {
                      EasyLoading.showError(state.failure.message);
                    } else if (state is SuccessGetCustomerList) {
                      EasyLoading.dismiss();
                    }
                  },
                  builder: (context, state) {
                    if (state is SuccessGetCustomerList) {
                      return Column(
                        children: [
                          ...state.listCustomer
                              .map((e) => SelectCustomerCard(customer: e)),
                          const EndSpace()
                        ],
                      );
                    }
                    return const SizedBox();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
