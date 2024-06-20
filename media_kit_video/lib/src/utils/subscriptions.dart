import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';

mixin SubscriptionsMixin<T extends StatefulWidget> on State<T> {
 
 final _Subscriptions _subscription = _Subscriptions();


  void addSubscription(StreamSubscription subscription) {
    _subscription.add(subscription);
  }

 void addAllSubscription(List<StreamSubscription> subscriptions) {
    _subscription.addAll(subscriptions);
  }

 void removeSubscription(StreamSubscription subscription) {
    _subscription.remove(subscription);
  }


  @override
  void dispose() {
    _subscription.cancelAll();
    super.dispose();
  }
}


class _Subscriptions with ListBase<StreamSubscription> {

  final _subscriptions = <StreamSubscription>[];

  @override
  void add(StreamSubscription element) {
    _subscriptions.add(element);
  }


  @override
  bool remove(Object? element) {
    return _subscriptions.remove(element);
  }

  
  @override
  int get length => _subscriptions.length;

  @override
  set length(int newLength) => _subscriptions.length = newLength;

  @override
  StreamSubscription operator [](int index) => _subscriptions[index];

  @override
  void operator []=(int index, StreamSubscription value) => _subscriptions[index] = value;


  Future<void> cancelAll()  async{
      await Future.wait(map((futureCancel) => futureCancel.cancel()));
  }

}