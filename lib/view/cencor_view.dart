import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CencorView extends StatelessWidget {
  const CencorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        SizedBox(height: 16),
        Center(
          child: Text(
            'Sensors',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Harnessing Real-Time Soil Data: Revolutionizing Agriculture with Driven Sensor Technology.",
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 24),
        SensorCard(),
        AddSensorCard()
      ],
    );
  }
}

class AddSensorCard extends StatelessWidget {
  const AddSensorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pushNamed('/add-sensor'),
      child: Container(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Add Sensor",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SensorCard extends StatelessWidget {
  const SensorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed('/fieldDetail'),
      child: Container(
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
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/components/image.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wheat Field 1",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "5 Ha - Ağdam",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.edit, color: Theme.of(context).primaryColor),
                        const SizedBox(height: 10),
                        Icon(Icons.settings,
                            color: Theme.of(context).primaryColor),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
