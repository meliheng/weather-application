import 'package:objectbox/objectbox.dart';

@Entity()
final class UserLocationModel {
  @Id()
  int id;
  final String city;

  UserLocationModel({this.id = 0, required this.city});
}
