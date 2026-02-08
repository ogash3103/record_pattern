
typedef UserProfile = ({
  String name,
  int age,
  String city,
  String? phone,
  String? email,
});

UserProfile createUserProfile({
required String name,
required int age,
required String city,
String? phone,
String? email,
}) {
  return (
  name: name,
  age: age,
  city: city,
  phone: phone,
  email: email,
  );
}


void printUserProfile(UserProfile profile) {
  final (:name, :age, :city, :phone, :email) = profile;

  print("== User Profile ==");
  print("Name: $name");
  print("Age: $age");
  print("City: $city");
  print("Phone: ${phone ?? 'Yo`q'}");
  print("Email: ${email ?? "Yo`q"}");
}


void main() {
  final u1 = createUserProfile(
    name: "Ogabek",
    age: 22,
    city: "Tashkent",
    phone: "+998901234567",
    email: "ogabek@gmail.com",
  );

  // 2) Telefon bor, email yo‘q
  final u2 = createUserProfile(
    name: "Ali",
    age: 30,
    city: "Samarkand",
    phone: "901112233",
  );

  // 3) Telefon ham yo‘q, email ham yo‘q
  final u3 = createUserProfile(
    name: "Vali",
    age: 19,
    city: "Bukhara",
  );

  printUserProfile(u1);
  print("");
  printUserProfile(u2);
  print("");
  printUserProfile(u3);
}