# FreeFlowUI

Build fully server driven cross-platform mobile apps with ease.

## Getting started

### Setup Server First
Please  follow the instructions to setup [node-server-example](https://github.com/FreeFlowUI/node_server_example) before you proceed **Required**.

Ensure flutter is installed on your system head over to [flutter.dev](https://flutter.dev/) for further instructions.


- Clone this repo for the mobile app
```bash
gh repo clone FreeFlowUI/flutter_example
```
```bash
cd ./flutter_example
```
```bash
flutter pub get
```
- Open this project in any code editor
- Update the IP address to your machine's IPv4 in flutter_example/lib/src/app.dart
```dart
IO.Socket socket = IO.io('ws://<Your-IP-address>:3000',{
    'autoConnect': true,
    'transports': ['websocket'],
});
```
- Save your changes and then run
```bash
flutter run
```

## Demo Video

To see FreeFlowUI in action, watch the demo video below:

[![Watch the demo]](https://firebasestorage.googleapis.com/v0/b/freshers-2021.appspot.com/o/FreeFlow_demonstration_2%20(1).mov?alt=media&token=d47923ce-653a-45a0-8bf6-83f7f468e660)