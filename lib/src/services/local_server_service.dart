import 'dart:io';

import 'package:inshort_test/db/video_table_service.dart';
import 'package:path/path.dart' as p;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../utilities/export.dart';

class LocalServerService {
  LocalServerService._();
  static final LocalServerService instance = LocalServerService._();

  static Database? _database;
  static const int _databaseVersion = 1; // Increase when upgrading

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final docdir = await getDatabasesPath();
    String path = p.join(docdir, 'app.db');
    return _database = await openDatabase(
      path,
      version: _databaseVersion,
      singleInstance: false,
      onConfigure: (Database db) async {
        // Add support for cascade delete
        await db.execute("PRAGMA foreign_keys = ON");
      },
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onDowngrade: _onDowngrade,
    );
  }

  // Initial Database Schema + Seeding Default Data
  Future<void> _onCreate(Database db, int version) async {
    VideoTableService.instance.initialize(db);
    Log.log("XXX: DONE creating tables");
  }

  // Handle Migrations + Backups
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    Log.log("DB : _onUpgrade() : OLD-$oldVersion : NEW-$newVersion");
    await _backupDatabase(); // Backup before migrating

    if (oldVersion < 2) {
      _upgradeToV2(db);
    }
    if (oldVersion < 3) {
      _upgradeToV3(db);
    }
    if (oldVersion < 4) {
      _upgradeToV4(db);
    }
  }

  // Handle Rollbacks (Downgrade)
  Future<void> _onDowngrade(Database db, int oldVersion, int newVersion) async {
    Log.log("DB : _onDowngrade() : OLD-$oldVersion : NEW-$newVersion");
    await _restoreDatabase(); // Restore from backup before downgrade

    if (oldVersion > newVersion) {
      if (newVersion == 4) {
        _downgradeToV4(db);
      }
      if (newVersion == 3) {
        _downgradeToV3(db);
      }
      if (newVersion == 2) {
        _downgradeToV2(db);
      }
      if (newVersion == 1) {
        _downgradeToV1(db);
      }
    }
  }

  // Backup Database before upgrading
  Future<void> _backupDatabase() async {
    String dbPath = join(await getDatabasesPath(), 'app.db');
    String backupPath = join(await getDatabasesPath(), 'backup_app.db');

    File dbFile = File(dbPath);
    if (await dbFile.exists()) {
      await dbFile.copy(backupPath);
      Log.log("Database backup created at: $backupPath");
    }
  }

  // Restore Database (For Downgrades)
  Future<void> _restoreDatabase() async {
    String dbPath = join(await getDatabasesPath(), 'app.db');
    String backupPath = join(await getDatabasesPath(), 'backup_app.db');

    File backupFile = File(backupPath);
    if (await backupFile.exists()) {
      await backupFile.copy(dbPath);
      Log.log("Database restored from backup.");
    }
  }

  // Custom migration for downgrading 1 version
  Future<void> _downgradeToV1(Database db) async {
    Log.log("DB : Downgrading to V1");
  }

  Future<void> _downgradeToV2(Database db) async {
    Log.log("DB : Downgrading to V2");
  }

  Future<void> _downgradeToV3(Database db) async {
    Log.log("DB : Downgrading to V3");
  }

  Future<void> _downgradeToV4(Database db) async {
    Log.log("DB : Downgrading to V4");
  }

  // Custom functions for downgrading 1 version
  Future<void> _upgradeToV2(Database db) async {
    Log.log("DB : Upgrading to V2");
  }

  Future<void> _upgradeToV3(Database db) async {
    Log.log("DB : Upgrading to V3");
  }

  Future<void> _upgradeToV4(Database db) async {
    Log.log("DB : Upgrading to V4");
  }
}
