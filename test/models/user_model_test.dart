import 'package:waterproject3/models/user_model.dart';
import 'package:test/test.dart';

void main() {
  group("name attribute", () {
    test("should be a string", () {
      User user = User(name: "User 1", weight: 65.5);
      expect(user.name is String, true);
    });
  });
  group("weight attribute", () {
    test("should be a double", () {
      User user = User(name: "User 1", weight: 65.5);
      expect(user.weight is double, true);
    });
  });
}