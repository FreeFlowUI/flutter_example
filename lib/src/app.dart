import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freeflow_flutter/freeflow_flutter.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

final uiJsonProvider = StateProvider<Map<String,dynamic>>((ref)=>{});

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    IO.Socket socket = IO.io('ws://192.168.1.13:3000',{
    'autoConnect': true,
    'transports': ['websocket'],
  });
    socket.onConnect((_) {
      if (kDebugMode) {
        print('connect');
      }
      socket.emit('msg', 'test');
    });
    socket.on('application', (response){
      ref.read(uiJsonProvider.notifier).update((state) => response);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ref.listen(uiJsonProvider, (p,n){
      log("UI Refreshed!");
    });
    return MaterialApp(
      home: Consumer(
        builder: (context, ref, widget) {
          
          final uiJson = ref.watch(uiJsonProvider);
          return WidgetEngine().renderJSON(uiJson);
        }
      ),
    );
  }
}