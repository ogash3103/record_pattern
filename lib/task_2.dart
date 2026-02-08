void printFullName(
({String firstName, String fatherName, String lastName}) fullName
) {
  final (:firstName, :fatherName, :lastName) = fullName;
  print("Ism: $firstName");
  print("Otasining ismi: $fatherName");
  print("Familiya: $lastName");
}

void main() {
  final user = (
    firstName: "Ogabek",
    fatherName: "Faxriddin",
    lastName: "Faxriddinov",
  );

 printFullName(user);
}