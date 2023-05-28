abstract class ServiceEvent {}

class EvGetServiceList extends ServiceEvent {
  final String subCtgrCode;
  EvGetServiceList(this.subCtgrCode);
}
