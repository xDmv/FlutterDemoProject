import 'dart:convert';
import 'dart:io';

import 'package:example_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeExamplePage extends StatefulWidget {
  const StripeExamplePage({super.key});

  static const path = '/stripe';

  @override
  _StripeExamplePageState createState() => _StripeExamplePageState();
}

class _StripeExamplePageState extends State<StripeExamplePage> {
  final _formKey = GlobalKey<FormState>();

  final kStripePublishableKey =
      'pk_test_51Hf3MgHNDZLAi5jEt8y92iT59q7Q6lDiKP038VqNC4MKewCljTPadw8JmySudx4H6NTK3GMK5azzOekC4cgerZ7g00twvs7hC0';
  final kStripeSecretKey =
      'sk_test_51Hf3MgHNDZLAi5jEiYtO8L7s6q5aqKtrLLEBNOX3pitvqpKedwNFp7eDm9tPVBoJyloBm1iMTnGvRTUfKU4Cbr3Z007SyW6Lpo';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Stripe.publishableKey = kStripePublishableKey;
      // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
      // Stripe.urlScheme = 'flutterstripe';
      await Stripe.instance.applySettings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).authorization)),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // const Expanded(child: SizedBox()),
                SizedBox(
                  width: double.infinity,
                  child: SignInButton(
                    Buttons.Google,
                    text: "Оплата карткою",
                    onPressed: makeCardPayment,
                  ),
                ),

                if (Platform.isAndroid)
                  SizedBox(
                    width: double.infinity,
                    child: SignInButton(
                      Buttons.Google,
                      text: "+ GooglePay",
                      onPressed: makeGPayment,
                    ),
                  ),
                // const SizedBox(height: 30),

                if (Platform.isIOS)
                  SizedBox(
                    width: double.infinity,
                    child: SignInButton(
                      Buttons.Apple,
                      text: "+ ApplePay",
                      onPressed: makeAPayment,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> makeCardPayment() async {
    try {
      //STEP 1: Create Payment Intent
      final paymentIntent = await createPaymentIntent('100', 'USD');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              appearance: const PaymentSheetAppearance(
                primaryButton: PaymentSheetPrimaryButtonAppearance(
                  colors: PaymentSheetPrimaryButtonTheme(
                    light: PaymentSheetPrimaryButtonThemeColors(
                      background: Colors.blue,
                    ),
                  ),
                ),
              ),
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              style: ThemeMode.light,
              merchantDisplayName: 'Merchant Display Name',
            ),
          )
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> makeGPayment() async {
    try {
      //STEP 1: Create Payment Intent
      final paymentIntent = await createPaymentIntent('100', 'USD');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              appearance: const PaymentSheetAppearance(
                primaryButton: PaymentSheetPrimaryButtonAppearance(
                  colors: PaymentSheetPrimaryButtonTheme(
                    light: PaymentSheetPrimaryButtonThemeColors(
                      background: Colors.blue,
                    ),
                  ),
                ),
              ),
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: PaymentSheetApplePay(
              //   merchantCountryCode: 'US',
              // ),
              googlePay: PaymentSheetGooglePay(
                merchantCountryCode: 'US',
                testEnv: true,
              ),
              style: ThemeMode.light,
              merchantDisplayName: 'Merchant Display Name',
            ),
          )
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> makeAPayment() async {
    try {
      //STEP 1: Create Payment Intent
      final paymentIntent = await createPaymentIntent('100', 'USD');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              appearance: const PaymentSheetAppearance(
                primaryButton: PaymentSheetPrimaryButtonAppearance(
                  colors: PaymentSheetPrimaryButtonTheme(
                    light: PaymentSheetPrimaryButtonThemeColors(
                      background: Colors.blue,
                    ),
                  ),
                ),
              ),
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              applePay: PaymentSheetApplePay(
                merchantCountryCode: 'US',
              ),
              style: ThemeMode.light,
              merchantDisplayName: 'Merchant Display Name',
            ),
          )
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $kStripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(S.of(context).paymentSuccessful),
                    ],
                  ),
                ));

        // paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text(S.of(context).paymentFailed),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}
