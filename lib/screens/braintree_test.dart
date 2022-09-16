import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class Braintree extends StatefulWidget {
  const Braintree({Key? key}) : super(key: key);
  static const String id = 'Braintree';

  @override
  State<Braintree> createState() => _BraintreeState();
}

class _BraintreeState extends State<Braintree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var request = BraintreeDropInRequest(
                tokenizationKey: 'sandbox_5rc7tcbp_hhvcmt74t2bfyz9y',
                collectDeviceData: true,
                paypalRequest: BraintreePayPalRequest(
                  amount: '1.00',
                  displayName: 'Luke Skywalker',
                ),
                cardEnabled: true,
              );
              BraintreeDropInResult? result = await BraintreeDropIn.start(request);
            if(result != null){
              print(result.paymentMethodNonce.description);
              print(result.paymentMethodNonce.nonce);
            }
              },
            child: Text('Pay')),
      ),
    );
  }
}
