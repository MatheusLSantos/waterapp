import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<PermissionStatus> requestNotificationPermission(BuildContext context) async {
    // Verifique se a permissão de notificação está concedida
    PermissionStatus status = await Permission.notification.status;

    if (status.isDenied || status.isProvisional) {
      // A permissão foi negada ou ainda não foi solicitada, solicite-a
      status = await Permission.notification.request();

      if (status.isDenied) {
        // O usuário negou a permissão, você pode mostrar uma mensagem ou fornecer uma alternativa
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Permissão Negada'),
            content: Text('Para receber notificações, é necessário conceder permissão.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
    return status;
  }
}
