import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  /// Request storage permissions and return the download directory path
  static Future<String?> getDownloadDirectory() async {
    try {
      // Get the download directory path
      final downloadDirectory =
          await ExternalPath.getExternalStoragePublicDirectory(
              ExternalPath.DIRECTORY_DOWNLOADS);
      return downloadDirectory;
    } catch (e) {
      debugPrint('Error getting download directory: $e');
      return null;
    }
  }

  /// Check if we have permission to write to external storage
  static Future<bool> hasStoragePermission() async {
    try {
      // Check if we have storage permission
      final status = await Permission.storage.status;
      return status.isGranted;
    } catch (e) {
      debugPrint('Storage permission check failed: $e');
      return false;
    }
  }

  /// Request storage permission
  static Future<bool> requestStoragePermission() async {
    try {
      final status = await Permission.storage.request();
      return status.isGranted;
    } catch (e) {
      debugPrint('Storage permission request failed: $e');
      return false;
    }
  }

  /// Check and request storage permission if needed
  static Future<bool> ensureStoragePermission() async {
    // First check if we already have permission
    if (await hasStoragePermission()) {
      return true;
    }

    // Request permission if we don't have it
    return await requestStoragePermission();
  }

  /// Show permission explanation dialog
  static Future<bool> showPermissionExplanationDialog(
      BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Storage Permission Required'),
              content: const Text(
                'This app needs access to your device\'s storage to save Excel files to the Downloads folder. '
                'Please grant storage permission to continue.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Grant Permission'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  /// Show permission denied dialog
  static Future<void> showPermissionDeniedDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text(
            'Storage permission is required to export Excel files. '
            'You can grant permission in your device settings.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );
  }
}
