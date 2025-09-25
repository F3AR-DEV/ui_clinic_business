import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../network/api_client.dart';

class SyncService {
  final ApiClient apiClient = ApiClient();
  Timer? _timer;

  // Iniciar sincronización periódica
  void startSync({Duration interval = const Duration(seconds: 30)}) {
    _timer = Timer.periodic(interval, (_) async {
      final connectivity = await Connectivity().checkConnectivity();
      if (!connectivity.contains(ConnectivityResult.none)) {
        // await _syncPending();
      }
    });
  }

  void stopSync() {
    _timer?.cancel();
  }

  // Sincroniza pendientes con la API
  // Future<void> _syncPending() async {
  //   try {
  //     // Ejemplo: tabla "patients"
  //     final pending = await LocalDb.getPending('patients');

  //     // Enviar pendientes al servidor
  //     for (var item in pending) {
  //       final response = await apiClient.post('patients', item);

  //       // Actualizar estado a "synced"
  //       await LocalDb.update(
  //         'patients',
  //         {'sync_status': 'synced'},
  //         'id = ?',
  //         [item['id']],
  //       );
  //     }

  //     // Traer cambios desde API y actualizar local
  //     final remoteData = await apiClient.get('patients');
  //     for (var patient in remoteData['data']) {
  //       await LocalDb.insert('patients', {...patient, 'sync_status': 'synced'});
  //     }

  //     print('Sincronización completada');
  //   } catch (e) {
  //     print('Error en sincronización: $e');
  //   }
  // }
}
