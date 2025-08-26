import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartfarm_mobile/gen_l10n/l10n.dart';

class ExcelExportService {
  /// Export farm data to Excel file
  static Future<String?> exportToExcel({
    required L10n l10n,
    required List<List<String>> plantingData,
    required List<List<String>> harvestData,
    required Map<String, dynamic> userInputs,
    required String inspectionDate,
  }) async {
    try {
      // Create Excel workbook
      final excel = Excel.createExcel();

      // Create Planting Data Sheet
      final plantingSheet = excel['Planting Data'];

      // Add title
      plantingSheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
        ..value = 'Smart Farm - Planting Data Report'
        ..cellStyle = CellStyle(
          bold: true,
          fontSize: 16,
        );

      // Add inspection date
      plantingSheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1))
        ..value = 'Inspection Date: $inspectionDate'
        ..cellStyle = CellStyle(
          bold: true,
          fontSize: 12,
        );

      // Add user inputs section
      plantingSheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 3))
        ..value = 'User Inputs:'
        ..cellStyle = CellStyle(
          bold: true,
          fontSize: 14,
        );

      int currentRow = 4;
      userInputs.forEach((key, value) {
        plantingSheet.cell(
            CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: currentRow))
          ..value = '$key: $value';
        currentRow++;
      });

      // Add planting data table
      currentRow += 2;
      plantingSheet.cell(
          CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: currentRow))
        ..value = 'Planting Data:'
        ..cellStyle = CellStyle(
          bold: true,
          fontSize: 14,
        );

      currentRow++;
      // Add headers
      final plantingHeaders = [
        l10n.zone,
        l10n.strength,
        l10n.germinationRate,
        l10n.wateringMethodHeader,
        l10n.fertilizedHeader,
        l10n.pestFoundHeader,
        l10n.plantingNotesHeader,
      ];

      for (int i = 0; i < plantingHeaders.length; i++) {
        plantingSheet.cell(
            CellIndex.indexByColumnRow(columnIndex: i, rowIndex: currentRow))
          ..value = plantingHeaders[i]
          ..cellStyle = CellStyle(
            bold: true,
            backgroundColorHex: '#E0E0E0',
          );
      }

      // Add data rows
      currentRow++;
      for (int i = 0; i < plantingData.length; i++) {
        for (int j = 0; j < plantingData[i].length; j++) {
          plantingSheet.cell(
              CellIndex.indexByColumnRow(columnIndex: j, rowIndex: currentRow))
            ..value = plantingData[i][j];
        }
        currentRow++;
      }

      // Create Harvest Data Sheet
      final harvestSheet = excel['Harvest Data'];

      // Add title
      harvestSheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
        ..value = 'Smart Farm - Harvest Data Report'
        ..cellStyle = CellStyle(
          bold: true,
          fontSize: 16,
        );

      // Add inspection date
      harvestSheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1))
        ..value = 'Inspection Date: $inspectionDate'
        ..cellStyle = CellStyle(
          bold: true,
          fontSize: 12,
        );

      // Add harvest data table
      currentRow = 3;
      harvestSheet.cell(
          CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: currentRow))
        ..value = 'Harvest Data:'
        ..cellStyle = CellStyle(
          bold: true,
          fontSize: 14,
        );

      currentRow++;
      // Add headers
      final harvestHeaders = [
        l10n.zone,
        l10n.totalHarvestedHeader,
        l10n.totalWeightHeader,
        l10n.damagedDefectiveHeader,
        l10n.harvestNotesHeader,
      ];

      for (int i = 0; i < harvestHeaders.length; i++) {
        harvestSheet.cell(
            CellIndex.indexByColumnRow(columnIndex: i, rowIndex: currentRow))
          ..value = harvestHeaders[i]
          ..cellStyle = CellStyle(
            bold: true,
            backgroundColorHex: '#E0E0E0',
          );
      }

      // Add data rows
      currentRow++;
      for (int i = 0; i < harvestData.length; i++) {
        for (int j = 0; j < harvestData[i].length; j++) {
          harvestSheet.cell(
              CellIndex.indexByColumnRow(columnIndex: j, rowIndex: currentRow))
            ..value = harvestData[i][j];
        }
        currentRow++;
      }

      // Note: Column width setting is not available in this version of the excel package

      // Get documents directory
      final directory = await getApplicationDocumentsDirectory();
      final fileName =
          'smartfarm_data_${DateTime.now().millisecondsSinceEpoch}.xlsx';
      final filePath = '${directory.path}/$fileName';

      // Save file
      final file = File(filePath);
      await file.writeAsBytes(excel.encode()!);

      return filePath;
    } catch (e) {
      print('Error exporting to Excel: $e');
      return null;
    }
  }
}
