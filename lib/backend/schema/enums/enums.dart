import 'package:collection/collection.dart';

enum UserRole {
  IndividualUser,
  BusinessOwner,
}

enum MediaType {
  Photo,
  Video,
}

enum ContentType {
  Flyer,
  Photo,
  Video,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UserRole):
      return UserRole.values.deserialize(value) as T?;
    case (MediaType):
      return MediaType.values.deserialize(value) as T?;
    case (ContentType):
      return ContentType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
