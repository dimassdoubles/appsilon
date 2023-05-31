import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_bloc.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_event.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_state.dart';
import 'package:appsilon/src/features/customer/presentation/widgets/customer_card_with_edit_button.dart';
import 'package:appsilon/src/shared/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/widgets/styled_text_form_field.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
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
      appBar: AppBar(title: const Text('Customer List')),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.paddingRegular),
        child: Column(
          children: [
            StyledTextFormField(
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
                          children: state.listCustomer
                              .map((e) =>
                                  CustomerCardWithEditButton(customer: e))
                              .toList(),
                        );
                      }
                      return const SizedBox();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
