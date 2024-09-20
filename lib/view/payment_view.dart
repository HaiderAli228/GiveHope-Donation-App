import 'package:donation_app/utils/button.dart';
import 'package:flutter/material.dart';

import '../routes/routes_name.dart';
import '../utils/app_color.dart';
import '../utils/small_widgets.dart';
import '../utils/text_field.dart';
import '../view_model/stripe_services.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesName.signUpScreen);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColor.themeColor
                        .withOpacity(0.1), // Light shade of themeColor
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_back, color: AppColor.themeColor),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SmallWidgets.circularIcon(context, Icons.attach_money_outlined),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Payment",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text:
                            "Join the movement for change. Donate to give hope to ",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                    TextSpan(
                        text: " GiveHope",
                        style: TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins")),
                    TextSpan(
                        text: " members",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SmallWidgets.textIs("Enter Amount"),
              CustomTextField(
                  controllerIs: amountController,
                  hintTextIs: "Rs.3000",
                  keyboardApperanceType: TextInputType.emailAddress,
                  prefixIconIs: Icons.attach_money_rounded),
              RoundButton(
                buttonText: "Donate",
                onPressed: () {
                  StripeService.instance.makePayment();
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
