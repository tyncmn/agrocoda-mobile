import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/controllers/field_controller.dart';
import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/router/auto_router.gr.dart';
import 'package:cookers_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class AddCencorView extends ConsumerStatefulWidget {
  const AddCencorView({super.key});

  @override
  ConsumerState<AddCencorView> createState() => _AddCencorViewState();
}

class _AddCencorViewState extends ConsumerState<AddCencorView> {
  late final TextEditingController _locController;
  late final TextEditingController _deviceController;
  late final TextEditingController _hectarController;

  @override
  void initState() {
    super.initState();
    _locController = TextEditingController();
    _deviceController = TextEditingController();
    _hectarController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _locController.dispose();
    _deviceController.dispose();
    _hectarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(fieldController, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        data: (data) {
          final List<String?> names =
              data.recommend.map<String>((e) => e?.name).toList();

          final int fieldId = data.id ?? 0;
          context.router.replace(
            SensorResultRoute(
              names: names as List<String>,
              fieldId: fieldId,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sensor added successfully'),
            ),
          );
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Something went wrong"),
            ),
          );
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Sensor'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SensorTextField(
              icon: 'assets/components/hectar.svg',
              title: 'Enter your field hectar',
              controller: _hectarController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            SensorTextField(
              icon: 'assets/components/farm.svg',
              title: 'Enter your field location',
              controller: _locController,
            ),
            const SizedBox(height: 20),
            SensorTextField(
              icon: 'assets/components/device.svg',
              title: 'Device ID',
              keyboardType: TextInputType.number,
              controller: _deviceController,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: CustomButton(
                title: 'Add Sensor',
                color: Theme.of(context).primaryColor,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  final controller = ref.read(fieldController.notifier);

                  controller.addField(
                    FieldRequest(
                      arduino: int.tryParse(_deviceController.text) ?? 0,
                      loc: _locController.text,
                      area: int.tryParse(_hectarController.text) ?? 0,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SensorTextField extends StatelessWidget {
  const SensorTextField({
    Key? key,
    required this.icon,
    required this.title,
    this.controller,
    this.hintText,
    this.keyboardType,
  }) : super(key: key);

  final String icon;
  final String title;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            icon,
          ),
        ),
        hintText: hintText,
        labelText: title,
        labelStyle: const TextStyle(
          color: Color(0xFF939393),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF25A047),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF25A047),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF25A047),
          ),
        ),
      ),
    );
  }
}
