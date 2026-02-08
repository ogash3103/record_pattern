
({String name, int age, String city}) mapToRecord(
    Map<String, dynamic> data,
) {
  final {
    'name': String name,
    'age': int age,
    'city': String city,
  } = data;

  return (name: name, age: age, city: city);
}

void main() {
  final userMap = {
    "name": "Ogabek",
    "age" : 22,
    "city": "Tashkent",
  };


  final userRecord = mapToRecord(userMap);

  print("Name: ${userRecord.name}");
  print("Age: ${userRecord.age}");
  print("City: ${userRecord.city}");

}