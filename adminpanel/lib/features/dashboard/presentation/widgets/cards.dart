import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class DCards extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final CardTypes cardtype;
  final Widget body;

  const DCards(
      {super.key,
      this.width = 0,
      this.height = 0,
      required this.color,
      required this.cardtype,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: switch (cardtype) {
        CardTypes.small => cardSm(context, color, body),
        CardTypes.mid => cardMd(context, color, body),
        CardTypes.large => throw UnimplementedError(),
        CardTypes.square => square(context, color, body),
        CardTypes.rectangle => rectangle(context, color, body),
      },
    );
  }

  Widget cardSm(BuildContext context, Color color, Widget body) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSizes.borderRadiusMd),
        color: color,
      ),
      child: body,
    );
  }

  Widget cardMd(BuildContext context, Color color, Widget body) {
    return Container(
      height: 400,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSizes.borderRadiusMd),
        color: color,
      ),
      child: body,
    );
  }

  Widget square(BuildContext context, Color color, Widget body) {
    return Container(
      height: 490,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSizes.borderRadiusMd),
        color: color,
      ),
      child: body,
    );
  }

  Widget rectangle(BuildContext context, Color color, Widget body) {
    return Container(
      height: 400,
      width: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSizes.borderRadiusMd),
        color: color,
      ),
      child: body,
    );
  }
}
