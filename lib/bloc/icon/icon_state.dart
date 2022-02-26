abstract class IconState {}

class IconInitial extends IconState {}

class IconLoading extends IconState {}

class IconSuccess extends IconState {
  final String icon;

  IconSuccess(this.icon);
}

class IconError extends IconState {}
