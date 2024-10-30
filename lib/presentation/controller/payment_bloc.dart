import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/services/fawry_payment.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_payment_info_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/record_user_payment_info_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/show_payment_data_screen.dart';

import '../../domain/usecase/get_user_cards_manager_info_usecase.dart';

class PaymentBloc extends Bloc<PaymentEvents, PaymentState> {
  final GetUserPaymentInfoUsecase getUserPaymentInfoUsecase;
  final RecordUserPaymentInfoUsecase recordUserPaymentInfoUsecase;
  final GetUserCardsManagerInfoUsecase getUserCardsManagerInfoUsecase;
  PaymentBloc(
    this.getUserPaymentInfoUsecase,
    this.recordUserPaymentInfoUsecase,
    this.getUserCardsManagerInfoUsecase,
  ) : super(const PaymentState()) {
    on<StartPaymentEvent>((event, emit) async {
      final result = await getUserPaymentInfoUsecase.execute();
      result.fold(
        (l) => emit(
          PaymentState(
              requestState: RequestState.error, errorMessage: l.message),
        ),
        (r) async {
          startPayment(r, event.items);
          return emit(PaymentState(customerModel: r));
        },
      );
    });
    on<RecordPaymentEvent>((event, emit) async {
      emit(const PaymentState(requestState: RequestState.loading));
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => ShowPaymentDataScreen(
            name: event.data["customerName"].toString(),
            price: event.data["paymentAmount"].toString(),
            refNumber: event.data["referenceNumber"].toString(),
          ),
        ),
      );
      final result =
          await recordUserPaymentInfoUsecase.execute(event.refNumber);
      result.fold((l) {
        Navigator.pop(event.context);
        showRedToast("error occured while processing payment please try again");
        return emit(
          PaymentState(
            requestState: RequestState.error,
            errorMessage: l.message,
          ),
        );
      }, (r) {
        if (!event.showRefNumber) {
          Navigator.pop(event.context);
        }
        showGreenToast("Payment Completed");
        return emit(const PaymentState(requestState: RequestState.loaded));
      });
    });
    on<OpenCardsManagerEvent>((event, emit) async {
      final result = await getUserCardsManagerInfoUsecase.execute();
      result.fold(
        (l) => emit(
          PaymentState(
            requestState: RequestState.error,
            errorMessage: l.message,
          ),
        ),
        (r) async {
          openCardsManager(r);
          return emit(PaymentState(customerModel: r));
        },
      );
    });
  }
}
