import 'dart:math';

import 'package:bank_app/model/transaction.dart';

class Repository {
  List<Transaction> transactions = [];
  List<String> listOfTransactionNames = [
    'Ашан',
    'Просмотр баланса',
    'Лукойл',
    'Билайн'
  ];

  List<Transaction> transactList() {
    Random rndom = Random();
    List<Transaction> tmpList = [];
    for (int i = 0; i < 10; i++) {
      tmpList.add(Transaction(
        transactionName: listOfTransactionNames[rndom.nextInt(4)],
        sum: rndom.nextInt(5000),
        dateTime: DateTime(2021, 1, i, 1),
      ));
    }

    return tmpList;
  }
}
