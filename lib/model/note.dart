import 'package:flutter/material.dart';

@immutable
class Note {
  const Note(
    this.title,
    this.content,
    this.date,
    this.priority,
  );

  final String title;
  final String content;
  final String date;
  final Priority priority;
}


enum Priority {
  low,
  medium,
  high,
}
