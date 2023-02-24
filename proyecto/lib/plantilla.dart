import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _cityName = "Madrid";
  String _weatherCondition = "Sunny";
  String _temperature = "25";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _cityName,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            Text(
              _weatherCondition,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              _temperature + "°C",
              style: TextStyle(fontSize: 64),
            ),
          ],
        ),
      ),
    );
  }
}
