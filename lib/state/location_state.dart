import '../model/status.dart';
import '../model/location.dart';

typedef LocationCallBack = void Function(Location location);
typedef LocationStatusListener = void Function(LocationStatus? status);

class LocationState {
  Set<LocationCallBack> listener = {};
  Set<LocationCallBack> failListener = {};
  Set<LocationStatusListener> statusListener = {};
}
