// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';

import 'package:test_encrypted_sql/queued_item_store/queued_item_store.dart';

import 'package:meta/meta.dart';

/// {@template amplify_analytics_pinpoint_dart.dart_queued_item_store}
/// Stores strings using IndexedDB for web and Drift for all other platforms.
/// {@endtemplate}
class DartQueuedItemStore implements QueuedItemStore {
  /// {@macro amplify_analytics_pinpoint_dart.dart_queued_item_store}
  // ignore: avoid_unused_constructor_parameters
  DartQueuedItemStore(String? storagePath) {
    throw UnimplementedError('constructor has not been implemented.');
  }

  @override
  FutureOr<Iterable<QueuedItem>> getCount(int count) {
    throw UnimplementedError('getCount() has not been implemented.');
  }

  @override
  FutureOr<void> addItem(String string) {
    throw UnimplementedError('addItem() has not been implemented.');
  }

  @override
  FutureOr<void> deleteItems(Iterable<QueuedItem> items) {
    throw UnimplementedError('deleteItems() has not been implemented.');
  }

  @override
  FutureOr<void> close() async {
    throw UnimplementedError('close() has not been implemented.');
  }

  @override
  @visibleForTesting
  FutureOr<void> clear() async {
    throw UnimplementedError('clear() has not been implemented.');
  }
}
