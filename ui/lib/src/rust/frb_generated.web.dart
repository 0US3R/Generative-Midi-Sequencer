// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.9.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

// Static analysis wrongly picks the IO variant, thus ignore this
// ignore_for_file: argument_type_not_assignable

import 'app.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_web.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg
  get rust_arc_decrement_strong_count_BaseRustStatePtr =>
      wire.rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_RustStatePtr =>
      wire.rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState;

  CrossPlatformFinalizerArg
  get rust_arc_decrement_strong_count_SequencerPatternPtr =>
      wire.rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  BaseRustState
  dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    dynamic raw,
  );

  @protected
  RustState
  dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    dynamic raw,
  );

  @protected
  SequencerPattern
  dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    dynamic raw,
  );

  @protected
  BaseRustState
  dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    dynamic raw,
  );

  @protected
  RustState
  dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    dynamic raw,
  );

  @protected
  SequencerPattern
  dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    dynamic raw,
  );

  @protected
  RustState
  dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    dynamic raw,
  );

  @protected
  SequencerPattern
  dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    dynamic raw,
  );

  @protected
  BaseRustState
  dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    dynamic raw,
  );

  @protected
  RustState
  dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    dynamic raw,
  );

  @protected
  SequencerPattern
  dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    dynamic raw,
  );

  @protected
  RustStreamSink<void> dco_decode_StreamSink_unit_Sse(dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  double dco_decode_f_32(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  List<SequencerPattern>
  dco_decode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    dynamic raw,
  );

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  List<SequencerStep> dco_decode_list_sequencer_step(dynamic raw);

  @protected
  SequencerStep dco_decode_sequencer_step(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  BigInt dco_decode_usize(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  BaseRustState
  sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    SseDeserializer deserializer,
  );

  @protected
  RustState
  sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    SseDeserializer deserializer,
  );

  @protected
  SequencerPattern
  sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SseDeserializer deserializer,
  );

  @protected
  BaseRustState
  sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    SseDeserializer deserializer,
  );

  @protected
  RustState
  sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    SseDeserializer deserializer,
  );

  @protected
  SequencerPattern
  sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SseDeserializer deserializer,
  );

  @protected
  RustState
  sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    SseDeserializer deserializer,
  );

  @protected
  SequencerPattern
  sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SseDeserializer deserializer,
  );

  @protected
  BaseRustState
  sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    SseDeserializer deserializer,
  );

  @protected
  RustState
  sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    SseDeserializer deserializer,
  );

  @protected
  SequencerPattern
  sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SseDeserializer deserializer,
  );

  @protected
  RustStreamSink<void> sse_decode_StreamSink_unit_Sse(
    SseDeserializer deserializer,
  );

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  double sse_decode_f_32(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  List<SequencerPattern>
  sse_decode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SseDeserializer deserializer,
  );

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  List<SequencerStep> sse_decode_list_sequencer_step(
    SseDeserializer deserializer,
  );

  @protected
  SequencerStep sse_decode_sequencer_step(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
    AnyhowException self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    BaseRustState self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    RustState self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SequencerPattern self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    BaseRustState self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    RustState self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SequencerPattern self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    RustState self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SequencerPattern self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    BaseRustState self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    RustState self,
    SseSerializer serializer,
  );

  @protected
  void
  sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    SequencerPattern self,
    SseSerializer serializer,
  );

  @protected
  void sse_encode_StreamSink_unit_Sse(
    RustStreamSink<void> self,
    SseSerializer serializer,
  );

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_f_32(double self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void
  sse_encode_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    List<SequencerPattern> self,
    SseSerializer serializer,
  );

  @protected
  void sse_encode_list_prim_u_8_strict(
    Uint8List self,
    SseSerializer serializer,
  );

  @protected
  void sse_encode_list_sequencer_step(
    List<SequencerStep> self,
    SseSerializer serializer,
  );

  @protected
  void sse_encode_sequencer_step(SequencerStep self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  RustLibWire.fromExternalLibrary(ExternalLibrary lib);

  void
  rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    int ptr,
  ) => wasmModule
      .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
        ptr,
      );

  void
  rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    int ptr,
  ) => wasmModule
      .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
        ptr,
      );

  void
  rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    int ptr,
  ) => wasmModule
      .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
        ptr,
      );

  void
  rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    int ptr,
  ) => wasmModule
      .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
        ptr,
      );

  void
  rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    int ptr,
  ) => wasmModule
      .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
        ptr,
      );

  void
  rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    int ptr,
  ) => wasmModule
      .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
        ptr,
      );
}

@JS('wasm_bindgen')
external RustLibWasmModule get wasmModule;

@JS()
@anonymous
extension type RustLibWasmModule._(JSObject _) implements JSObject {
  external void
  rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    int ptr,
  );

  external void
  rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBaseRustState(
    int ptr,
  );

  external void
  rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    int ptr,
  );

  external void
  rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerRustState(
    int ptr,
  );

  external void
  rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    int ptr,
  );

  external void
  rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSequencerPattern(
    int ptr,
  );
}
