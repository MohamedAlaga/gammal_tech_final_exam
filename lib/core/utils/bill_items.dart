/// this file contains the pyament plans for the application
library;

import 'package:fawry_sdk/model/bill_item.dart';

BillItem economy = BillItem(
  itemId: 'Economy pack',
  description: '10 attempts for practicing',
  price: 50,
  quantity: 1,
);

BillItem gold = BillItem(
  itemId: 'Gold pack',
  description: '40 attempts for practicing',
  price: 150,
  quantity: 1,
);

BillItem premium = BillItem(
  itemId: 'Premium pack',
  description: '100 attempts for practicing',
  price: 300,
  quantity: 1,
);

BillItem monthlySup = BillItem(
  itemId: 'Monthly Subscription pack',
  description: 'Infinity attempts for practicing',
  price: 500,
  quantity: 1,
);
