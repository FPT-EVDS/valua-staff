import 'package:json_annotation/json_annotation.dart';

enum NotificationStatus {
  @JsonValue(2)
  assigned,
  @JsonValue(3)
  pendingReport,
  @JsonValue(4)
  resolvedReport,
}
