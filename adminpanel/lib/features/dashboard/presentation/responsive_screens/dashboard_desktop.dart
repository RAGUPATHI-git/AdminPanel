import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/dashboard/presentation/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: DSizes.spaceBtwSections,
          ),
          Row(
            children: [
              const SizedBox(
                width: DSizes.spaceBtwCards - 20,
              ),
              Expanded(
                  child: DCards(
                      color: Colors.white,
                      cardtype: CardTypes.small,
                      body: cardContent(context, "Total Downloads",
                          DAnimations.chart, "126", 90, 90))),
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.small,
                    body: cardContent(context, "Students Logged in",
                        DAnimations.student, "500", 80, 80)),
              ),
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.small,
                    body: cardContent(context, "New Resource Entries",
                        DAnimations.book, "34", 60, 60)),
              ),
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.small,
                    body: cardContent(context, "Total Study Materials Uploaded",
                        DAnimations.docs, "242", 65, 65)),
              ),
              const SizedBox(
                width: DSizes.spaceBtwCards - 20,
              ),
            ],
          ),
          const SizedBox(
            height: DSizes.spaceBtwSections,
          ),
          Row(
            children: [
              SizedBox(
                width: DSizes.spaceBtwCards - 20,
              ),
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.rectangle,
                    body: graph(context)),
              ),
              DCards(
                  color: Colors.white,
                  cardtype: CardTypes.mid,
                  body: table(context)),
              SizedBox(
                width: DSizes.spaceBtwCards - 20,
              ),
            ],
          )
        ],
      ),
    ));
  }

  Widget cardContent(BuildContext context, String title, String animation,
      String data, double? height, double? width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        const SizedBox(
          height: DSizes.spaceBtwItems - 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                data,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            LottieBuilder.asset(
              animation,
              height: height,
              width: width,
              animate: true,
            )
          ],
        )
      ],
    );
  }

  Widget graph(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: DSizes.sm,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Activity"),
        ),
        Divider(
          thickness: 1,
          endIndent: 10,
          indent: 10,
        ),
      ],
    );
  }

  Widget table(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: DSizes.sm,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Upcoming Events"),
        ),
        Divider(
          thickness: 1,
          endIndent: 10,
          indent: 10,
        ),
      ],
    );
  }
}
