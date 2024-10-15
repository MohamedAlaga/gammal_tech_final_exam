import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/services/fawry_payment.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_payment_info_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvents, PaymentState> {
  final GetUserPaymentInfoUsecase getUserPaymentInfoUsecase;
  PaymentBloc(this.getUserPaymentInfoUsecase) : super(const PaymentState()) {
    on<StartPaymentEvent>((event, emit) async {
      final result = await getUserPaymentInfoUsecase.execute();
      result.fold(
          (l) => emit(PaymentState(
              requestState: RequestState.error, errorMessage: l.message)),
          (r)async{
                    await startPayment(r,event.items);
            return emit(PaymentState(
              requestState: RequestState.loaded, customerModel: r));});
    });
  }
}
