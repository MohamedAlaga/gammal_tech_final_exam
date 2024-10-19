import 'dart:async';
import 'dart:convert';

import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/model/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/services/fawry_payment.dart';
import 'package:gammal_tech_final_exam/core/utils/bill_items.dart';
import 'package:gammal_tech_final_exam/presentation/components/pricing_card.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_events.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  late StreamSubscription? _fawryCallbackResultStream;

  @override
  void initState() {
    super.initState();
    initSDKCallback();
  }

  @override
  void dispose() {
    _fawryCallbackResultStream?.cancel();
    super.dispose();
  }

  Future<void> initSDKCallback() async {
    try {
      _fawryCallbackResultStream =
          FawrySDK.instance.callbackResultStream().listen((event) {
        if (event == null || event.isEmpty) {
          // Handle the event being null or empty (optional)
          return;
        }

        setState(() {
          ResponseStatus response = ResponseStatus.fromJson(jsonDecode(event));
          handleResponse(response, context);
        });
      }, onError: (error) {
        if (error is PlatformException &&
            error.code == '1' &&
            error.message == 'Cancelled') {
          debugPrint("Payment process was cancelled.");
        } else {
          debugPrint("An error occurred: $error");
        }
      });
    } catch (ex) {
      debugPrint("Exception during SDK callback: $ex");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Center(
              child: Column(
                children: [
                  PricingCard(
                    title: 'Economy',
                    price: '50EP',
                    features: const ['15 Attemps', '1 Month validity'],
                    cardColor: Colors.white,
                    textColor: const Color(0xff094546),
                    borderColor: const Color(0xffFF904D),
                    buttonText: 'Start',
                    onTap: () async {
                      BlocProvider.of<PaymentBloc>(context)
                          .add(StartPaymentEvent([economy]));
                    },
                  ),
                  PricingCard(
                    title: 'Gold',
                    price: '150EP',
                    features: const ['40 Attemps', '2 Month validity'],
                    cardColor: Colors.white,
                    textColor: const Color(0xff094546),
                    borderColor: const Color(0xffFF904D),
                    buttonText: 'Start',
                    onTap: () async {
                      BlocProvider.of<PaymentBloc>(context)
                          .add(StartPaymentEvent([gold]));
                    },
                  ),
                  PricingCard(
                    title: 'Premium',
                    price: '300EP',
                    features: const ['100 Attemps', '2 Month validity'],
                    cardColor: Colors.white,
                    textColor: const Color(0xff094546),
                    borderColor: const Color(0xffFF904D),
                    buttonText: 'Start',
                    onTap: () async {
                      BlocProvider.of<PaymentBloc>(context)
                          .add(StartPaymentEvent([premium]));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
