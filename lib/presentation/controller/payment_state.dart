import 'package:equatable/equatable.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';

class PaymentState extends Equatable {
  final String? refNumber;
  final LaunchCustomerModel? customerModel;
  final String errorMessage;
  final RequestState requestState;

  const PaymentState({
    this.refNumber,
    this.customerModel,
    this.errorMessage = '',
    this.requestState = RequestState.loading,
  });

  @override
  List<Object?> get props =>
      [refNumber, customerModel, errorMessage, requestState];
}
