import 'dart:async';

import 'package:test_encrypted_sql/queued_item_store/dart_queued_item_store.dart';

import 'package:test_encrypted_sql/queued_item_store/queued_item_store.dart';

class EventClient {
  EventClient(String path) : _store = DartQueuedItemStore(path);

  final DartQueuedItemStore _store;

  Future<void> testSave(String string) async {
    await _store.addItem(string);
  }

  FutureOr<Iterable<QueuedItem>> testRetrieve(int count) {
    return _store.getCount(count);
  }

  Future<void> testClear() async {
    await _store.clear();
  }
}
