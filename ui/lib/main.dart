import 'package:flutter/material.dart';
import 'package:ui/src/rust/app.dart';
import 'package:ui/src/rust/frb_generated.dart';
import 'package:ui/widgets/bpm.dart';
import 'package:ui/widgets/start_stop.dart';
import 'package:ui/widgets/sequencer.dart';

void main() => runRustApp(body: body, state: RustState.new);

Widget body(state) {
  return MaterialApp(
    theme: ThemeData.dark(),
    home: Scaffold(body: SafeArea(child: Column(children: [Sequencer()]))),
  );
}
