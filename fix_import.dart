import 'dart:io';

void main(List<String> args) {
  // Cấu hình
  const packageName =
      'flutter_mvvm_riverpod'; // Đổi theo tên package trong pubspec.yaml
  const oldPrefix = '../../repository/';
  const newPrefix =
      'package:flutter_mvvm_riverpod/network/remote/repository/repository_impl/';

  final apply = args.contains('--apply');

  final impRegex = RegExp(r'(import|export|part)\s+[' '\']([^"\']+)["\']');

  final dartFiles = Directory('lib/')
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .toList();

  int totalUpdated = 0;

  for (final file in dartFiles) {
    try {
      final original = file.readAsStringSync();
      var content = original;
      var changed = false;

      for (final m in impRegex.allMatches(original)) {
        final importPath = m.group(2);
        if (importPath == null) continue;

        if (importPath.startsWith(oldPrefix)) {
          final newPath = importPath.replaceFirst(oldPrefix, newPrefix);
          content = content.replaceAll(importPath, newPath);
          changed = true;

          print('[MATCH] ${file.path}');
          print('  $importPath -> $newPath');
        }
      }

      if (changed) {
        totalUpdated++;
        if (apply) {
          // create backup
          // final backupPath = '${file.path}.bak';
          // File(backupPath).writeAsStringSync(original);
          file.writeAsStringSync(content);
          print('[APPLIED] ${file.path} \n');
        } else {
          print('[DRY-RUN] Would change ${file.path}\n');
        }
      }
    } catch (e, st) {
      print('Error processing ${file.path}: $e\n$st');
    }
  }

  print('---');
  print('Total files updated: $totalUpdated');
  print('Dry-run mode: ${!apply}');
  print('Run again with --apply to actually write changes.');
}
