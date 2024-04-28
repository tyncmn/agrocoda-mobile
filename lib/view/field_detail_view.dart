import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/custom_piechart.dart';

@RoutePage()
class FieldDetailView extends StatefulWidget {
  const FieldDetailView({super.key});

  @override
  State<FieldDetailView> createState() => _FieldDetailViewState();
}

class _FieldDetailViewState extends State<FieldDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => context.router.popForced(),
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: context.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            SizedBox(width: context.dynamicWidth(0.24)),
            Text(
              'Wheat Field',
              style: context.largerTextStyle,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CustomPieChart(),
            ),
          ],
        ),
      ),
    );
  }
}
