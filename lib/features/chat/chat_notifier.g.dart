// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'chat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatNotifierHash() => r'9d6936f1d060c7db9c50e7d81d9c18e04ea35247';

/// See also [ChatNotifier].
@ProviderFor(ChatNotifier)
final chatNotifierProvider = AutoDisposeNotifierProvider<ChatNotifier,
    ({ChatSession chat, List<Message> messages})>.internal(
  ChatNotifier.new,
  name: r'chatNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatNotifier
    = AutoDisposeNotifier<({ChatSession chat, List<Message> messages})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
