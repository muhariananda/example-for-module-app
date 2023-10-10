import 'package:intl/intl.dart';

String getCurrentDate() {
  final currentDate = DateTime.now();
  final formatter = DateFormat('d MMM');
  final formattedDate = formatter.format(currentDate);

  return formattedDate;
}
