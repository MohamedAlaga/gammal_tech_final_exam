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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_events.dart';

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

void handleResponse(ResponseStatus response, BuildContext context) {
  switch (response.status) {
    case FawrySDK.RESPONSE_SUCCESS:
      {}
      break;
    case FawrySDK.RESPONSE_ERROR:
      {
        if (response.message != "Cancelled") {
          showRedToast(
              "error occured while processing payment please try again");
        }
      }
      break;
    case FawrySDK.RESPONSE_PAYMENT_COMPLETED:
      {
        print("FawrySDK.RESPONSE_PAYMENT_COMPLETED");
        debugPrint('Payment Completed: ${response.message}, ${response.data}');
        var data = jsonDecode(response.data!);
        if (data["paymentMethod"] == "PayAtFawry") {
          BlocProvider.of<PaymentBloc>(context).add(RecordPaymentEvent(
              data["referenceNumber"].toString(), true, context, data));
        } else {
          BlocProvider.of<PaymentBloc>(context).add(RecordPaymentEvent(
              data["referenceNumber"].toString(), false, context, data));
        }
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
  model.launchMerchantModel.merchantRefNum =
      "78${FawryUtils.randomAlphaNumeric(8)}";
  await FawryService().startPayment(model);
}
