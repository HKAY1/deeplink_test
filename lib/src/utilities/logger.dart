// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

class Log {
  static void log(dynamic text) => Logger().d(text);
  static void error(dynamic text) => Logger().e(text);
  static void warning(dynamic text) => Logger().w(text);
  static void info(dynamic text) => Logger().i(text);
  static void wtf(dynamic text) => Logger(printer: CustomPrinter()).f(text);
}

class CustomPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final PrettyPrinter printer = PrettyPrinter();
    final AnsiColor? color = printer.levelColors?[event.level];
    final String? emoji = printer.levelEmojis?[event.level];
    final dynamic message = event.message;
    return <String>[color!('$emoji: $message')];
  }
}
