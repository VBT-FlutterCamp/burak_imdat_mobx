part of './task_service.dart';

enum _TaskServiceEndpoint { USERS }

extension TaskServiceEndpointExtension on _TaskServiceEndpoint {
  String get rawValue {
    switch (this) {
      case _TaskServiceEndpoint.USERS:
        return '/users';
    }
  }
}
