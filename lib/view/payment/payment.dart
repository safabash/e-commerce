import 'package:e_commerce_app/helpers/constants.dart';
import 'package:e_commerce_app/controller/payment/razor_pay_controller.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/address/add_address_controller.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

late PaymentOptionController paymentOptionController;

class _PaymentOptionState extends State<PaymentOption> {
  @override
  void initState() {
    paymentOptionController =
        Provider.of<PaymentOptionController>(context, listen: false);

    paymentOptionController.razorPayInitFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Consumer<PaymentOptionController>(
        builder: (context, value, child) {
          return Stepper(
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kcolor)),
                    onPressed: details.onStepContinue,
                    child: const Text('NEXT',
                        style: TextStyle(color: Colors.black)),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              );
            },
            currentStep: paymentOptionController.index1,
            onStepCancel: () {
              value.cancelFunction();
            },
            onStepContinue: () {
              value.continueFunction();
            },
            onStepTapped: (int index) {
              value.onStepTapped(index);
            },
            steps: <Step>[
              Step(
                title: const Text('Confirm Address'),
                isActive: value.index1 >= 0,
                state:
                    value.index1 >= 0 ? StepState.complete : StepState.disabled,
                content: Consumer<AddressController>(
                  builder: (context, value1, child) {
                    return value1.isLoading == true
                        ? const Center(child: CircularProgressIndicator())
                        : Card(
                            margin: const EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              title: Text(
                                value1.address[value1.selectedType].name ??
                                    'hfh',
                                style: const TextStyle(
                                    fontFamily: 'Radley', fontSize: 21),
                              ),
                              subtitle: Text(
                                "Phone : ${value1.address[value1.selectedType].phone}\n Address :${value1.address[value1.selectedType].address}\n City: ${value1.address[value1.selectedType].city},\n Pin:${value1.address[value1.selectedType].pincode}",
                                style: const TextStyle(
                                    fontFamily: 'Radley', fontSize: 16),
                              ),
                            ),
                          );
                  },
                ),
              ),
              Step(
                title: const Text('Payment Option'),
                isActive: value.index1 >= 1,
                state:
                    value.index1 >= 1 ? StepState.complete : StepState.disabled,
                content: Column(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Radio(
                              activeColor: kcolor,
                              value: 'online',
                              groupValue: value.selectedType,
                              onChanged: ((newValue) {
                                value.radionButtonChange(newValue.toString());
                              })),
                          title: const Text(
                            'online',
                            style: TextStyle(
                                fontFamily: 'Radley',
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(
                            Icons.payment_outlined,
                            color: kcolor,
                          ),
                        ),
                        boxheight20,
                        ListTile(
                          leading: Radio(
                              activeColor: kcolor,
                              value: 'cod',
                              groupValue: value.selectedType, //
                              onChanged: ((newValue) {
                                value.radionButtonChange(newValue.toString());
                              })),
                          title: const Text(
                            'cod',
                            style: TextStyle(
                                fontFamily: 'Radley',
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(
                            Icons.payment_outlined,
                            color: kcolor,
                          ),
                        ),
                        boxheight20
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
