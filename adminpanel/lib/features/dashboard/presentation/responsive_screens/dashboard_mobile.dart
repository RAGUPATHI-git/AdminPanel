import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_data.dart';
import 'package:adminpanel/features/dashboard/presentation/cubit/chart_cubit.dart';
import 'package:adminpanel/features/dashboard/presentation/widgets/cards.dart';
import 'package:adminpanel/features/dashboard/presentation/widgets/chart.dart';
import 'package:adminpanel/features/dashboard/presentation/widgets/pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

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
              Expanded(
                  child: DCards(
                      color: Colors.white,
                      cardtype: CardTypes.small,
                      body: cardContent(context, "Total Downloads",
                          DAnimations.chart, "126", 90, 90))),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.small,
                    body: cardContent(context, "Students Logged in",
                        DAnimations.student, "500", 80, 80)),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.small,
                    body: cardContent(context, "New Resource Entries",
                        DAnimations.book, "34", 60, 60)),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.small,
                    body: cardContent(context, "Total Study Materials Uploaded",
                        DAnimations.docs, "242", 65, 65)),
              ),
            ],
          ),
          const SizedBox(
            height: DSizes.spaceBtwSections,
          ),
          Row(
            children: [
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.rectangle,
                    body: graph(context)),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DCards(
                    color: Colors.white,
                    cardtype: CardTypes.mid,
                    body: table(context)),
              ),
            ],
          ),
       const   SizedBox(
            width: DSizes.spaceBtwCards - 20,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: DSizes.sm,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Activity"),
        ),
        const Divider(
          thickness: 1,
          endIndent: 10,
          indent: 10,
        ),
        SizedBox(
          height: 295,
          width: 800,
          child: BlocBuilder<ChartCubit, List<ChartData>>(
            builder: (context, chartData) {
              return chartData.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ChartWidget(chartData: chartData),
                    );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () => context.read<ChartCubit>().loadChart(),
          child: const Icon(Icons.refresh),
        )
      ],
    );
  }

  Widget table(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: DSizes.sm,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Upcoming Events"),
        ),
        const Divider(
          thickness: 1,
          endIndent: 10,
          indent: 10,
        ),
        const SizedBox(
          height: 200,
          width: 500,
          child: Center(child: PieChartWidget()),
        ),
        const SizedBox(
          height: DSizes.spaceBtwItems,
        ),
        SizedBox(
          height: 100,
          width: 400,
          child: ListView(
            children: [
              Text("title 1 : "),
              Text("title 2 : "),
              Text("title 3 : "),
              Text("title 4 : "),
            ],
          ),
        )
      ],
    );
  }
}
