import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success: ${response.paymentId}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment Success: ${response.paymentId}'),
    ));
    // TODO: Handle success logic here (e.g., unlock premium content)
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.code} - ${response.message}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment Error: ${response.code} - ${response.message}'),
    ));
    // TODO: Handle error logic here
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet: ${response.walletName}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('External Wallet: ${response.walletName}'),
    ));
    // TODO: Handle external wallet logic here
  }

  void _openCheckout() {
    var options = {
      'key': 'rzp_test_tetY2ITxhZi4vS',
      'amount': 100, // 10 Rupees (in paise)
      'name': 'M-Recipe',
      'description': 'Payment for Services',
      'prefill': {
        'contact': '', // You can prefill with user's phone number if needed
        'email': '', // You can prefill with user's email if needed
      },
      'external': {
        'wallets': ['paytm', 'phonepe', 'upi'],
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error initializing Razorpay: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _openCheckout();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Make Payment',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
