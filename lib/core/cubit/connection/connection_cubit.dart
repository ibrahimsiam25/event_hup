import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectionStatus { connected, disconnected }

class ConnectionCubit extends Cubit<ConnectionStatus> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  ConnectionCubit() : super(ConnectionStatus.connected) {
    _initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      result = [ConnectivityResult.none];
    }
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    final isConnected =
        connectivityResults.isNotEmpty &&
        !connectivityResults.contains(ConnectivityResult.none);

    if (isConnected) {
      emit(ConnectionStatus.connected);
    } else {
      emit(ConnectionStatus.disconnected);
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
