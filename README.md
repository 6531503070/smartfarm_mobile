# smartfarm_mobile

A doitung smartfarm mobile application, intregation to IOT.

## Features

- **Excel Export**: Export farm data to Excel files saved in the device's Downloads folder
- **Multi-language Support**: Supports English, Thai, and Myanmar languages
- **Data Management**: Track planting and harvest data with detailed analytics

## Excel Export Functionality

The app can export farm data to Excel files that are automatically saved to the device's Downloads folder. The exported file includes:

- **Planting Data Sheet**: Zone information, strength, germination rate, watering method, fertilization status, pest detection, and planting notes
- **Harvest Data Sheet**: Zone information, total harvested, total weight, damaged/defective items, and harvest notes
- **User Inputs**: Inspection date and zone information

### Permissions Required

The app requires the following permissions to export Excel files:
- `WRITE_EXTERNAL_STORAGE`: To save files to the Downloads folder
- `READ_EXTERNAL_STORAGE`: To access the Downloads folder
- `MANAGE_EXTERNAL_STORAGE`: For Android 11+ to access external storage

### Permission Handling

The app includes intelligent permission handling:
- **Automatic Permission Requests**: The app will automatically request storage permissions when needed
- **User-Friendly Dialogs**: Clear explanation dialogs help users understand why permissions are needed
- **Settings Integration**: If permissions are denied, users can easily access device settings to grant them
- **Graceful Fallbacks**: The app handles permission denials gracefully without crashing

## Developer
```flutter
dart run intl_utils:generate
dart run build_runner build
```
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
