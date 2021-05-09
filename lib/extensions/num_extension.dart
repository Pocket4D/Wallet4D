part of 'extensions.dart';

extension NumExtension<T extends num> on T {
  T get lessThanOne => math.min<T>((this is int ? 1 : 1.0) as T, this);

  T get lessThanZero => math.min<T>((this is int ? 0 : 0.0) as T, this);

  T get moreThanOne => math.max<T>((this is int ? 1 : 1.0) as T, this);

  T get moreThanZero => math.max<T>((this is int ? 0 : 0.0) as T, this);

  T get betweenZeroAndOne => lessThanOne.moreThanZero;
}
