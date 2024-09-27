import 'package:flutter/material.dart';
import '../../utils/mqtt_service.dart';

class MQTTExampleScreen extends StatefulWidget {
  @override
  _MQTTExampleScreenState createState() => _MQTTExampleScreenState();
}

class _MQTTExampleScreenState extends State<MQTTExampleScreen> {
  late MQTTService mqttService;

  @override
  void initState() {
    super.initState();
    mqttService = MQTTService();
    mqttService.connect();
  }

  @override
  void dispose() {
    mqttService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MQTT Client Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                mqttService.publish('test/topic', 'Hello from Flutter!');
              },
              child: Text("Publish Message"),
            ),
          ],
        ),
      ),
    );
  }
}
