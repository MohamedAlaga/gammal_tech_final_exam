import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/components/shimmers.dart';
import 'package:gammal_tech_final_exam/presentation/components/user_history_card.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_state.dart';

class UserHistoryScreen extends StatelessWidget {
  const UserHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LogBloc>(context).add(FetchLogEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<LogBloc, LogState>(
          builder: (context, state) {
            switch (state.requestState) {
              case RequestState.loading:
                return Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          for (int i = 0; i < 8; i++)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: HistoryCardShimmer(),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              case RequestState.error:
                return Center(
                  child: Text(state.errorMessage),
                );
              case RequestState.loaded:
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Column(
                        children: [
                          for (int i = state.userLogs.length-1 ; i >=0; i--)
                            UserHistoryCard(
                              dateTime: state.userLogs[i].dateTime,
                              title: state.userLogs[i].description[0],
                              info: state.userLogs[i].description.sublist(1),
                              image: state.userLogs[i].imageUrl,
                            )
                        ],
                      ),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
