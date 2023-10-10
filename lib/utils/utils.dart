import 'dart:ui';

import 'package:example_for_module_app/model/priority.dart';

Color priorityToColor(Priority priority) {
  switch (priority) {
    case Priority.high:
      return const Color(0xFFff6b6b);
    case Priority.medium:
      return const Color(0xFFfeca57);
    case Priority.low:
      return const Color(0xFF1dd1a1);
  }
}
