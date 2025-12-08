import 'package:flutter_mvvm_riverpod/base/utils/database_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database_provider.g.dart';

@riverpod
Future<Database> database(Ref ref) async {
  final db = await DatabaseHelper.instance.database;

  ref.onDispose(() async {
    await DatabaseHelper.instance.close();
  });

  return db;
}
