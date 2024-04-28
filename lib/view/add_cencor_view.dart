import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class AddCencorView extends StatelessWidget {
  const AddCencorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Sensor'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SensorField(),
            SizedBox(height: 20),
            SensorField(),
            SizedBox(height: 20),
            SensorField(),
          ],
        ),
      ),
    );
  }
}

class SensorField extends StatelessWidget {
  const SensorField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF25A047),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/components/farm.svg',
            width: 32,
          ),
          const SizedBox(width: 20),
          const Text(
            'Add Sensor',
            style: TextStyle(
              color: Color(0xFF939393),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_down,
          )
        ],
      ),
    );
  }
}
