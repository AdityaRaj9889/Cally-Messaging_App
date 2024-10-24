import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

final DateFormat _formatter = DateFormat('yyyy-MM-dd');

class DateBubble extends GetView {
  final DateTime date;
  final Color color;

  const DateBubble({
    super.key,
    required this.date,
    this.color = const Color(0x558AD3D5),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 7,
        bottom: 7,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            getDateText(date),
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}

String getDateText(DateTime date) {
  final now = DateTime.now();
  if (_formatter.format(now) == _formatter.format(date)) {
    return 'Today';
  } else if (_formatter.format(DateTime(now.year, now.month, now.day - 1)) ==
      _formatter.format(date)) {
    return 'Yesterday';
  } else {
    return '${DateFormat('d').format(date)} ${DateFormat('MMMM').format(date)} ${DateFormat('y').format(date)}';
  }
}
