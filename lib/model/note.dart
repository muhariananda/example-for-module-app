import 'package:example_for_module_app/model/priority.dart';
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
