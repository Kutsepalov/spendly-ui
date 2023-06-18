import 'package:decimal/decimal.dart';
import 'package:flutter/animation.dart';
import 'package:spendly/views/utils/extensions/hex_color.dart';

class Account {
  final String? id;
  final String name;
  final String type;
  final Decimal amount;
  final String currency;
  final Color? color;

  Account({
    this.id,
    required this.name,
    required this.type,
    required this.amount,
    required this.currency,
    this.color,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        amount: Decimal.parse(json['amount'].toString()),
        currency: json['currency'],
        color: HexColor.fromHex(json['color']));
  }
}
