import 'package:donation_app/utils/button.dart';
import 'package:donation_app/utils/dialog_box.dart';
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
  final FocusNode amountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.04; // Padding based on screen width

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Unfocus the text field when tapping outside
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesName.signUpScreen);
                        },
                        child: Container(
                          height: size.height * 0.07,
                          width: size.height * 0.07,
                          decoration: BoxDecoration(
                            color: AppColor.themeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(size.height * 0.015),
                          child: const Icon(Icons.arrow_back,
                              color: AppColor.themeColor),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SmallWidgets.circularIcon(
                          context, Icons.attach_money_outlined),
                      SizedBox(
                        height: size.height * 0.02,
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
                                text: "Join the movement for change. Donate to give hope to ",
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
                        height: size.height * 0.02,
                      ),
                      SmallWidgets.textIs("Enter Amount"),
                      CustomTextField(
                        controllerIs: amountController,
                        hintTextIs: "Rs.3000",
                        focusNode: amountFocusNode,
                        keyboardApperanceType: TextInputType.number,
                        prefixIconIs: Icons.attach_money_rounded,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      RoundButton(
                        buttonText: "Next",
                        onPressed: () async {
                          if (amountController.text.isEmpty) {
                            DialogBox.errorDialogBox(
                                context, "Please enter an amount", "Warning");
                            return;
                          } else {
                            try {
                              await StripeService.instance
                                  .makePayment(
                                  int.parse(amountController.text), context)
                                  .then(
                                    (value) {
                                  print("Payment processed successfully");
                                },
                              );
                              amountController.clear();
                            } catch (e) {
                              print('Error in payment process: $e');
                              DialogBox.errorDialogBox(
                                  context, "Payment failed", "Try again.");
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Additional UI elements such as loading indicators can be placed here
          ],
        ),
      ),
    );
  }
}
