import 'package:grpc/grpc.dart';
import 'package:server/src/app/protos/generated/helloworld.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = GreeterClient(channel);

  final name = args.isNotEmpty ? args[0] : 'world';

  try {
    var response = await stub.sayHello(HelloRequest()..name = name);
    print('Greeter client received: ${response.message}');
    response = await stub.sayHelloAgain(HelloRequest()..name = name);
    print('Greeter client received: ${response.message}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}

class HelloworldClient {
  static Future<void> runExampleRpc(String name) async {
    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    final stub = GreeterClient(channel);

    try {
      var response = await stub.sayHello(
        HelloRequest(
          name: name,
        ),
      );
      print('Greeter client received: ${response.message}');
      response = await stub.sayHelloAgain(
        HelloRequest(
          name: name,
        ),
      );
      print('Greeter client received: ${response.message}');
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }
}
