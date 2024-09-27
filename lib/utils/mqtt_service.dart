import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  final String broker = 'broker.emqx.io'; // Change this to your broker
  final String clientId = 'localhost';
  MqttServerClient? _client;

  Future<void> connect() async {
    _client = MqttServerClient(broker, clientId);
    _client!.port = 1883;
    _client!.logging(on: true);
    _client!.keepAlivePeriod = 200;
    _client!.onDisconnected = onDisconnected;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean() // Non-persistent session
        .withWillQos(MqttQos.atLeastOnce);

    _client!.connectionMessage = connMessage;

    try {
      print('Connecting to the broker...');
      await _client!.connect();
      print('Connected');
    } catch (e) {
      print('Connection failed: $e');
      disconnect();
      return;
    }

    if (_client!.connectionStatus!.state == MqttConnectionState.connected) {
      print('Connected to the broker');
      // Now safe to subscribe and publish
      subscribe('test/topic'); // Change this to your topic
    } else {
      print('Failed to connect: ${_client!.connectionStatus!.state}');
      disconnect();
    }
  }

  void subscribe(String topic) {
    if (_client!.connectionStatus!.state == MqttConnectionState.connected) {
      _client!.subscribe(topic, MqttQos.atMostOnce);
      print('Subscribed to topic: $topic');

      _client!.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;
        final String message =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        print('Received message: $message from topic: ${c[0].topic}');
      });
    } else {
      print('Cannot subscribe, client is not connected.');
    }
  }

  void publish(String topic, String message) {
    if (_client!.connectionStatus!.state == MqttConnectionState.connected) {
      final builder = MqttClientPayloadBuilder();
      builder.addString(message);

      _client!.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
      print('Published message: $message to topic: $topic');
    } else {
      print('Cannot publish, client is not connected.');
    }
  }

  void disconnect() {
    _client!.disconnect();
    print('Disconnected from the broker');
  }

  void onDisconnected() {
    print('MQTT client disconnected');
  }
}
