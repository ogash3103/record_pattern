void main() {
  final today = (day: 7, month: 3, year: 2026);
  printDate(today);

  final anotherDate = (day: 25, month: 12, year: 2025);
  printDate(anotherDate);
}


void printDate(({int day, int month, int year}) date) {
  final (:day, :month, :year) = date;

  final dd = day.toString().padLeft(2, '0');
  final mm = month.toString().padLeft(2, '0');

  print("$dd/$mm/$year");
}