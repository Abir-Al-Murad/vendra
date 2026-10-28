import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/connectivity_service.dart';

final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService(
    ref.read(connectivityProvider),
  );
});