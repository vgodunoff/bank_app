import 'dart:ui';
import 'package:bank_app/bloc/blur_bloc.dart';
import 'package:bank_app/model/transaction.dart';
import 'package:bank_app/ui/ui_widgets/bottom_button.dart';
import 'package:bank_app/ui/ui_widgets/card_balance.dart';
import 'package:bank_app/ui/ui_widgets/card_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions;

  const HomePage({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlurBloc, BlurState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BlurInitial) {
            var transactions = state.transactions;
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CardBalance(),
                  CardTransactions(transactions: transactions),
                  BottomButton(
                    state: state,
                    blurEvent: MakeBlur(),
                  ),
                ],
              ),
            );
          }
          if (state is BlurDone) {
            var transactions = state.transactions;
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CardBalance(),
                  CardTransactions(transactions: transactions),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: BottomButton(
                      state: state,
                      blurEvent: AppStart(),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
