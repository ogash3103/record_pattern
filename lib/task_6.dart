({
  List<int> ints,
  List<String> strings,
  List<List<dynamic>> lists,
}) splitByType(List<dynamic> items) {
  final List<int> ints = [];
  final List<String> strings = [];
  final List<List<dynamic>> lists = [];

  for(final item in items) {
    switch (item) {
      case int i:
        ints.add(i);

      case String s:
        strings.add(s);


      case List<dynamic> l:
        lists.add(l);

      default: break;
    }
  }

  return (ints: ints, strings: strings, lists: lists);
}

void main() {
  final mixed = [
    1,
    "hello",
    [1, 2, 3],
    42,
    "dart",
    ["a", "b"],
    3.14,
    true,
  ];

  final result = splitByType(mixed);

  print("Ints: ${result.ints}");
  print("Strings: ${result.strings}");
  print("Lists: ${result.lists}");
}
