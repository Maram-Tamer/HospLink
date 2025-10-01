import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


Future<void> pushTo({
  required BuildContext context,
  required String route,
  Object? extra,
}) {
  return context.push(route, extra: extra);
}

pushWithReplacment({
  required BuildContext context,
  required String route,
  Object? extra,
}) {
  return context.pushReplacement(route, extra: extra);
}

pushAndRemoveUntil({
  required BuildContext context,
  required String route,
  Object? extra,
}) {
  return context.go(route, extra: extra);
}

pop(BuildContext context) {
  return context.pop();
}
