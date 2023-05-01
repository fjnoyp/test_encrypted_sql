// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';

import 'package:test_encrypted_sql/queued_item_store/drift/drift_queued_item_store.dart';

import 'package:test_encrypted_sql/queued_item_store/queued_item_store.dart';

import 'package:meta/meta.dart';

/// {@macro amplify_analytics_pinpoint_dart.dart_queued_item_store}
class DartQueuedItemStore implements QueuedItemStore {
  /// {@macro amplify_analytics_pinpoint_dart.dart_queued_item_store}
  factory DartQueuedItemStore(String? storagePath) {
    assert(
      storagePath != null,
      'A storage path is required on VM for locating the DB',
    );
    final database = DriftQueuedItemStore(storagePath!);
    return DartQueuedItemStore._(database);
  }

  DartQueuedItemStore._(this._database);

  final DriftQueuedItemStore _database;

  @override
  Future<void> addItem(String string) {
    return _database.addItem(string);
  }

  @override
  Future<void> deleteItems(Iterable<QueuedItem> items) {
    return _database.deleteItems(items);
  }

  @override
  Future<Iterable<QueuedItem>> getCount(int count) {
    return _database.getCount(count);
  }

  @override
  @visibleForTesting
  Future<void> clear() async {
    return _database.clear();
  }

  @override
  Future<void> close() async {
    return _database.close();
  }
}
