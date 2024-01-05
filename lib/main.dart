import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  Map data = await getData();

  runApp(
    MaterialApp(
      title: 'Ali Saieed',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Weather Data'),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white70,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Text('${data['request']['query']}',style: const TextStyle(fontSize: 22.0,color: Colors.deepPurple)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Latitude: ${data['location']['lat']}',style: const TextStyle(fontSize: 22.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Longitude: ${data['location']['lon']}',style: const TextStyle(fontSize: 22.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Localtime: ${data['location']['localtime']}',style: const TextStyle(fontSize: 22.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Temperature:  ${data['current']['temperature']}',style: const TextStyle(fontSize: 22.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Wind Speed: ${data['current']['wind_speed']}',style: const TextStyle(fontSize: 22.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Pressure: ${data['current']['pressure']}',style: const TextStyle(fontSize: 22.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Humidity: ${data['current']['humidity']}',style: const TextStyle(fontSize: 22.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Cloud Cover: ${data['current']['cloudcover']}',style: const TextStyle(fontSize: 22.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.network(data['current']['weather_icons'][0]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Future<Map> getData() async {
  Uri myUrl = Uri.parse('http://api.weatherstack.com/current?access_key=1f1f3d752382ebb6010bfc1eb245356e&query=New%20York');
  http.Response response = await http.get(myUrl);
  return json.decode(response.body);
}
