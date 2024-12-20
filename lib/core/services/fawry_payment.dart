///this file contains the fawry payment service
library;

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

/// Fawry service class to handle fawry payment
/// [getMerchantModel] get the merchant data model
/// [startPayment] start the payment
///
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

  Future<void> openCardsManager(FawryLaunchModel model) async {
    try {
      await FawrySDK.instance.openCardsManager(
        launchModel: model,
        baseURL: paymentUrl,
        lang: FawrySDK.LANGUAGE_ENGLISH,
      );
    } catch (e) {
      debugPrint('Error opening cards manager: $e');
    }
  }
}

/// Handle the response from the fawry payment
/// [response] response status
/// [context] current context
///
/// on success, show success message and notify server,
///   if the payment method is pay at fawry show reference
///   number and notify server
/// on failure, show error message
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

/// Get the current platform
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

/// Start the payment
/// [customer] customer data
/// [item] list of items to be paid
///
/// start the payment with the customer data and the items to be paid
/// all payments methods are allowed
/// the merchent referance number is generated randomly but starts with 78
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

/// Start the open cards manager
/// [customer] customer data
///
/// start the open cards manager with the customer data
/// all open cards manager methods are allowed
/// the merchent referance number is generated randomly but starts with 78
Future<void> openCardsManager(LaunchCustomerModel customer) async {
  FawryLaunchModel model = FawryLaunchModel(
    allow3DPayment: true,
    chargeItems: [],
    launchCustomerModel: customer,
    launchMerchantModel: FawryService.getMerchantModel(),
    skipLogin: true,
    skipReceipt: true,
    payWithCardToken: false,
    paymentMethods: PaymentMethods.ALL,
  );
  model.launchMerchantModel.merchantRefNum =
      "78${FawryUtils.randomAlphaNumeric(8)}";
  await FawryService().openCardsManager(model);
}
