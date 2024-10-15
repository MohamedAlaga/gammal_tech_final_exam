import 'dart:async';
import 'dart:convert';

import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/fawry_utils.dart';
import 'package:fawry_sdk/model/bill_item.dart';
import 'package:fawry_sdk/model/fawry_launch_model.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:fawry_sdk/model/launch_merchant_model.dart';
import 'package:fawry_sdk/model/payment_methods.dart';
import 'package:fawry_sdk/model/response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/screens/show_payment_data_screen.dart';

class FawryService {
  static LaunchMerchantModel getMerchantModel() {
    return LaunchMerchantModel(
      merchantCode: merchantCode,
      merchantRefNum: FawryUtils.randomAlphaNumeric(10),
      secureKey: secureKey,
    );
  }

  Future<void> startPayment(FawryLaunchModel model) async {
    try {
      await FawrySDK.instance.startPayment(
        launchModel: model,
        baseURL: paymentUrl,
        lang: FawrySDK.LANGUAGE_ENGLISH,
      );
    } catch (e) {
      debugPrint('Error starting payment: $e');
    }
  }
}

// Handle the response from Fawry SDK
void handleResponse(ResponseStatus response, BuildContext context) {
  switch (response.status) {
    case FawrySDK.RESPONSE_SUCCESS:
      {
        debugPrint('Message: ${response.message}');
        debugPrint('Json Response: ${response.data}');
        var data = jsonDecode(response.data!);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowPaymentDataScreen(
                    name: data["customerName"].toString(),
                    price: data["paymentAmount"].toString(),
                    refNumber: data["referenceNumber"].toString())));
      }
      break;
    case FawrySDK.RESPONSE_ERROR:
      {
        debugPrint('Error: ${response.message}');
        showRedToast("error occured while processing payment please try again");
      }
      break;
    case FawrySDK.RESPONSE_PAYMENT_COMPLETED:
      {
        debugPrint('Payment Completed: ${response.message}, ${response.data}');
        showGreenToast("Payment Completed");
      }
      break;
  }
}

// Get the current platform
String currentPlatform() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return 'Current platform --> Android';
    case TargetPlatform.iOS:
      return 'Current platform --> iOS';
    default:
      return 'Current platform --> Unknown';
  }
}

Future<void> startPayment(
    LaunchCustomerModel customer, List<BillItem> item) async {
  FawryLaunchModel model = FawryLaunchModel(
    allow3DPayment: true,
    chargeItems: item,
    launchCustomerModel: customer,
    launchMerchantModel: FawryService.getMerchantModel(),
    skipLogin: true,
    skipReceipt: true,
    payWithCardToken: false,
    paymentMethods: PaymentMethods.ALL,
  );
  model.launchMerchantModel.merchantRefNum = FawryUtils.randomAlphaNumeric(10);
  await FawryService().startPayment(model);
}
