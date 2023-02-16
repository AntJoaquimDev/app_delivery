// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/core/ui/styles/text_style.dart';

class DeliveryIncrementDecrementButom extends StatelessWidget {
  final bool _compact;
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;
  const DeliveryIncrementDecrementButom({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = false;
  const DeliveryIncrementDecrementButom.compact({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(5) : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: decrementTap,
              child: Text(
                '-',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: _compact ? 10 : 22,
                  color: context.colors.secundary,
                ),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: _compact ? 13 : 17,
              color: context.colors.secundary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: incrementTap,
              child: Text(
                '+',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: _compact ? 10 : 22,
                  color: context.colors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
