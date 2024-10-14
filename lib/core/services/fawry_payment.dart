import 'dart:async';

import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/fawry_utils.dart';
import 'package:fawry_sdk/model/bill_item.dart';
import 'package:fawry_sdk/model/fawry_launch_model.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:fawry_sdk/model/launch_merchant_model.dart';
import 'package:fawry_sdk/model/payment_methods.dart';
import 'package:fawry_sdk/model/response.dart';
import 'package:flutter/material.dart';



class Constants {
  static const String merchantCode = "770000019834";
  static const String secureKey = "6c65ee7b-9a31-49fb-9630-ca5546f6037a";
  static const String baseUrl = "https://atfawry.fawrystaging.com/";
}


class FawryService {
  static LaunchMerchantModel getMerchantModel() {
    return LaunchMerchantModel(
      merchantCode: Constants.merchantCode,
      merchantRefNum: FawryUtils.randomAlphaNumeric(10),
      secureKey: Constants.secureKey,
    );
  }

  Future<void> startPayment(FawryLaunchModel model) async {
    try {
      await FawrySDK.instance.startPayment(
        launchModel: model,
        baseURL: Constants.baseUrl,
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
        baseURL: Constants.baseUrl,
        lang: FawrySDK.LANGUAGE_ENGLISH,
      );
    } catch (e) {
      debugPrint('Error opening cards manager: $e');
    }
  }
}


BillItem item = BillItem(
  itemId: 'ITEM_ID',
  description: '',
  quantity: 5,
  price: 50,
);

List<BillItem> chargeItems = [item];


LaunchCustomerModel customerModel = LaunchCustomerModel(
  customerProfileId: '533518',
  customerName: 'John Doe',
  customerEmail: 'john.doe@xyz.com',
  customerMobile: '+201000000000',
);

FawryLaunchModel model = FawryLaunchModel(
  allow3DPayment: true,
  chargeItems: chargeItems,
  launchCustomerModel: customerModel,
  launchMerchantModel: FawryService.getMerchantModel(),
  skipLogin: true,
  skipReceipt: true,
  payWithCardToken: false,
  paymentMethods: PaymentMethods.ALL,
);
