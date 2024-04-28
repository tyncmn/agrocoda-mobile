import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/view/add_cencor_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SensorResultView extends StatelessWidget {
  const SensorResultView({super.key, required this.names});

  final List<String> names;

  @override
  Widget build(BuildContext context) {
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
            itemCount: names.length,
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
                      names[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Harnessing Real-Time Soil Data: Revolutionizing Agriculture with Driven Sensor Technology.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.router.pushNamed('/fieldDetail');
                      },
                      child: const Text('View Details'),
                    ),
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
          widget.controller!.text = DateFormat('dd-MM-yyyy').format(picked); // Tarihi controller'a yaz
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

