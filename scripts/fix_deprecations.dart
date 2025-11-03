import 'dart:io';

/// Script to automatically fix deprecated withOpacity() calls
/// Run: dart run scripts/fix_deprecations.dart

void main() async {
  final libDir = Directory('lib');
  if (!libDir.existsSync()) {
    print('Error: lib directory not found');
    exit(1);
  }

  int totalFiles = 0;
  int totalReplacements = 0;

  await for (final entity in libDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final content = await entity.readAsString();
      final lines = content.split('\n');
      final newLines = <String>[];
      int fileReplacements = 0;

      for (final line in lines) {
        if (line.contains('withOpacity(')) {
          // Replace withOpacity( with withValues(alpha:
          final newLine = line.replaceAll('withOpacity(', 'withValues(alpha:');
          newLines.add(newLine);
          fileReplacements++;
        } else {
          newLines.add(line);
        }
      }

      if (fileReplacements > 0) {
        await entity.writeAsString(newLines.join('\n'));
        print('Fixed $fileReplacements instances in ${entity.path}');
        totalFiles++;
        totalReplacements += fileReplacements;
      }
    }
  }

  print('\n✅ Fix complete!');
  print('Files modified: $totalFiles');
  print('Total replacements: $totalReplacements');
}
