import 'package:equatable/equatable.dart';
import 'package:fawry_sdk/model/bill_item.dart';

class PaymentEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartPaymentEvent extends PaymentEvents {
  final List<BillItem> items;
  StartPaymentEvent(this.items);
}

class EndPaymentEvent extends PaymentEvents {}

class CancelPaymentEvent extends PaymentEvents {}
