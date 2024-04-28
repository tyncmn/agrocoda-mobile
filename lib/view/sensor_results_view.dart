import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/controllers/field_controller.dart';
import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/router/auto_router.gr.dart';
import 'package:cookers_app/view/add_cencor_view.dart';
import 'package:cookers_app/view/login_view.dart';
import 'package:cookers_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SensorResultView extends ConsumerStatefulWidget {
  const SensorResultView(
      {super.key, required this.names, required this.fieldId});

  final List<String> names;
  final int fieldId;

  @override
  ConsumerState<SensorResultView> createState() => _SensorResultViewState();
}

class _SensorResultViewState extends ConsumerState<SensorResultView> {
  late final TextEditingController cropController, dateController;

  @override
  void initState() {
    super.initState();
    cropController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    cropController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(sensorController, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        data: (data) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sensor added successfully'),
            ),
          );
          context.router.replaceAll([const MainRoute()]);
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
        title: const Text('Sensor Results'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.names.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFF25A047),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      widget.names[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "We've analyzed for you! Discover our tailored suggestions here to enhance the health and productivity of your plant. Explore now and provide the best care for your plant.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SensorTextField(
              icon: 'assets/components/crop.svg',
              title: 'Enter the name of the crop',
              controller: TextEditingController(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SensorDateField(
              icon: 'assets/components/calendar.svg',
              title: 'Enter the date of plant',
              controller: TextEditingController(),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: CustomButton(
              title: 'Submit',
              color: Theme.of(context).primaryColor,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                final request = SensorRequest(
                  fieldId: widget.fieldId,
                  userId: ref.watch(userIdProvider),
                  date: dateController.text,
                  crop: cropController.text,
                );

                ref.read(sensorController.notifier).addField2(request);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SensorDateField extends StatefulWidget {
  const SensorDateField({
    super.key,
    required this.icon,
    required this.title,
    this.controller,
    this.hintText,
  });

  final String icon;
  final String title;
  final TextEditingController? controller;
  final String? hintText;

  @override
  State<SensorDateField> createState() => _SensorDateFieldState();
}

class _SensorDateFieldState extends State<SensorDateField> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        if (widget.controller != null) {
          widget.controller!.text = DateFormat('dd-MM-yyyy')
              .format(picked); // Tarihi controller'a yaz
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: widget.controller,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            widget.icon,
          ),
        ),
        hintText: widget.hintText,
        labelText: widget.title,
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
