import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool isCelsius = true; // Default temperature unit is Celsius

  late String city = 'Bangkok'; // Default city

  late Map<String, dynamic> data = {
    "city": "Bangkok",
    "country": "Thailand",
    "lastUpdated": "2023-10-26 18:35",
    "tempC": 28,
    "tempF": 80.6,
    "feelsLikeC": 35.5,
    "feelsLikeF": 95.9,
    "windKph": 5.3,
    "windMph": 3.8,
    "humidity": 64,
    "uv": 1.5,
    "condition": {
      "text": "Rain",
      "icon":
      "https://cdn.weatherapi.com/weather/128x128/day/296.png",
      "code": 1063
    }
  };

  void fetchData(String selectedCity) {
    if (selectedCity == 'Ratchaburi') {
      setState(() {
        data = {
          "city": "Ratchaburi",
          "country": "Thailand",
          "lastUpdated": "2023-10-26 11:30",
          "tempC": 38,
          "tempF": 100.4,
          "feelsLikeC": 36.5,
          "feelsLikeF": 97.7,
          "windKph": 3.6,
          "windMph": 1.4,
          "humidity": 18,
          "uv": 3,
          "condition": {
            "text": "Sunny",
            "icon":
            "https://cdn.weatherapi.com/weather/128x128/day/113.png",
            "code": 1000
          }
        };
      });
    } else if (selectedCity == 'Bangkok') {
      setState(() {
        data = {
          "city": "Bangkok",
          "country": "Thailand",
          "lastUpdated": "2023-10-25 19:45",
          "tempC": 32,
          "tempF": 89.6,
          "feelsLikeC": 38.1,
          "feelsLikeF": 100.5,
          "windKph": 6.8,
          "windMph": 4.3,
          "humidity": 70,
          "uv": 1,
          "condition": {
            "text": "Partly cloudy",
            "icon":
            "https://cdn.weatherapi.com/weather/128x128/night/116.png",
            "code": 1003
          }
        };
      });
    } else if (selectedCity == 'Nakhon Pathom') {
      setState(() {
        data = {
          "city": "Nakhon Pathom",
          "country": "Thailand",
          "lastUpdated": "2023-10-26 18:35",
          "tempC": 25,
          "tempF": 77.0,
          "feelsLikeC": 35.5,
          "feelsLikeF": 95.9,
          "windKph": 5.3,
          "windMph": 3.8,
          "humidity": 64,
          "uv": 1.5,
          "condition": {
            "text": "Rain",
            "icon":
            "https://cdn.weatherapi.com/weather/128x128/day/296.png",
            "code": 1063
          }
        };
      });
    }
  }
  void toggleTemperatureUnit() {
    setState(() {
      isCelsius = !isCelsius;
    });
  }
  String getTemperatureUnit() {
    return isCelsius ? '°C' : '°F';
  }

  String getWindSpeedUnit() {
    return isCelsius ? 'km/h' : 'mph';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightBlueAccent.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    fetchData('Bangkok');
                  },
                  tooltip: 'Bangkok',
                  child: const Text('Bangkok'),
                  backgroundColor: Colors.lightBlue.shade300,
                ),
                const SizedBox(width: 50),
                FloatingActionButton(
                  onPressed: () {
                    fetchData('Ratchaburi');
                  },
                  tooltip: 'Ratchaburi',
                  child: const Text('Ratchaburi'),
                  backgroundColor: Colors.lightBlue.shade300,
                ),
                const SizedBox(width: 50),
                FloatingActionButton(
                  onPressed: () {
                    fetchData('Nakhon Pathom');
                  },
                  tooltip: 'Nakhon Pathom',
                  child: const Text('Nakhon Pathom'),
                  backgroundColor: Colors.lightBlue.shade300,
                ),
                const SizedBox(width: 50),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 60),
              decoration: BoxDecoration(
              ),
              child: Text(
                '${data['city']}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 45),
            Text(
              ' ${data['country']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Last Updated : ${data['lastUpdated']}',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            Text(
              ' ${data['condition']['text']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.network(data['condition']['icon']),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${data[isCelsius ? 'tempC' : 'tempF']}${getTemperatureUnit()}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: toggleTemperatureUnit,
                  icon: Icon(Icons.swap_horiz),
                  tooltip: 'Switch temperature unit',
                ),
                Text(
                  isCelsius ? 'F' : 'C',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Wind: ${data[isCelsius ? 'windKph' : 'windMph']} ${getWindSpeedUnit()}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Humidity: ${data['humidity']}%',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'UV: ${data['uv']}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey.shade100,
    );
  }
}
