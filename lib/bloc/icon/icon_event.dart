abstract class IconEvent {}

class GetIcon extends IconEvent {
  final String icon;

  GetIcon(this.icon);
}
