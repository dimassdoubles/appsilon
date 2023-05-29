import 'dart:developer';

import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_bloc.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_event.dart';
import 'package:appsilon/src/features/customer/presentation/blocs/customer_state.dart';
import 'package:appsilon/src/shared/widgets/space/medium_space.dart';
import 'package:appsilon/src/shared/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/widgets/styled_text_form_field.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;

  late final CustomerBloc _customerBloc;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _phoneCtrl = TextEditingController();

    _customerBloc = getIt.get<CustomerBloc>();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
        child: Column(
          children: [
            StyledTextFormField(
              controller: _nameCtrl,
              labelText: 'Name',
            ),
            const RegularSpace(),
            StyledTextFormField(
              controller: _phoneCtrl,
              labelText: 'Phone',
            ),
            const MediumSpace(),
            BlocListener<CustomerBloc, CustomerState>(
              bloc: _customerBloc,
              listener: (context, state) {
                if (state is CustomerLoading) {
                  EasyLoading.show();
                } else if (state is CustomerFail) {
                  EasyLoading.showError(state.failure.message);
                } else if (state is SuccessAddCustomer) {
                  EasyLoading.showSuccess("Sukses menambahkan customer baru");
                  context.router.pop();
                }
              },
              child: ElevatedButton(
                  onPressed: () {
                    log("name, ${_nameCtrl.text}");
                    log("phone, ${_phoneCtrl.text}");

                    final name = _nameCtrl.text;
                    final phone = _phoneCtrl.text;

                    _customerBloc.add(EvAddCustomer(name: name, phone: phone));
                  },
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Save')))),
            )
          ],
        ),
      ),
    );
  }
}
