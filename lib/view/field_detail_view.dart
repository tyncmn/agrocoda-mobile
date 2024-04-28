import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/utils/assets_const.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:cookers_app/widgets/crop_status_card.dart';
import 'package:cookers_app/widgets/detail_item_card.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_piechart.dart';

@RoutePage()
class FieldDetailView extends StatefulWidget {
  const FieldDetailView({super.key});

  @override
  State<FieldDetailView> createState() => _FieldDetailViewState();
}

class _FieldDetailViewState extends State<FieldDetailView> {
  final List<String> items = [
    'Crop:',
    'Field:',
    'Size:',
    'Sow date:',
  ];
  final List<String> cropStatus = [
    'Planting date',
    'Soil health',
    'Accumalated GDD',
  ];
  final List<String> assets = [
    AssetConst.calendar,
    AssetConst.plant,
    AssetConst.ther,
  ];
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 185,
                  height: 185,
                  child: CustomPieChart(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27, right: 20),
                  child: Column(
                    children: [
                      ...List.generate(
                        4,
                        (index) => DetailItemCard(
                          item: items[index],
                          result: '',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                border: Border.all(color: context.primaryColor),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 22,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Crop status',
                        style: context.smallTextStyle,
                      ),
                      Text(
                        'Setup',
                        style: context.smallTextStyle.copyWith(
                          color: context.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(
                    3,
                    (index) => CropStatusCard(
                      cropStatus: cropStatus[index],
                      asset: assets[index],
                      result: '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
