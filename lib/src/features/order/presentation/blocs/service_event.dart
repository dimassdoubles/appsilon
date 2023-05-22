abstract class ServiceEvent {}

class EvGetServiceList extends ServiceEvent {
  final String subCtgrId;
  EvGetServiceList(this.subCtgrId);
}
