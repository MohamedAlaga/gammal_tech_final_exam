import 'package:equatable/equatable.dart';
import 'package:fawry_sdk/model/bill_item.dart';
import 'package:flutter/widgets.dart';

class PaymentEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartPaymentEvent extends PaymentEvents {
  final List<BillItem> items;
  StartPaymentEvent(this.items);
}

class RecordPaymentEvent extends PaymentEvents {
  final Map<String, dynamic> data;
  final BuildContext context;
  final String refNumber;
  final bool showRefNumber;
  RecordPaymentEvent(
    this.refNumber,
    this.showRefNumber,
    this.context,
    this.data,
  );
}

class OpenCardsManagerEvent extends PaymentEvents {}
