typedef Professor = ({
String name,
List<String> courses,
});

typedef Department = ({
String name,
List<Professor> professors,
});

typedef University = ({
String name,
List<Department> departments,
});

University addDepartment(University uni, String depName) {
  final (:name, :departments) = uni;


  final exists = departments.any((d) => d.name == depName);
  if (exists) return uni;

  final updatedDepartments = [
    ...departments,
    (name: depName, professors: <Professor>[]),
  ];

  return (name: name, departments: updatedDepartments);
}

University addProfessor(
    University uni, {
      required String deptName,
      required String professorName,
    }) {
  final (:name, :departments) = uni;

  bool departmentFound = false;

  final updatedDepartments = departments.map((dept) {
    final (name: dName, professors: profs) = dept;

    if (dName != deptName) return dept;

    departmentFound = true;

    final exists = profs.any((p) => p.name == professorName);
    if (exists) return dept;

    final updatedProfs = [
      ...profs,
      (name: professorName, courses: <String>[]),
    ];

    return (name: dName, professors: updatedProfs);
  }).toList();

  if (!departmentFound) return uni;

  return (name: name, departments: updatedDepartments);
}

University addCourse(
    University uni, {
      required String deptName,
      required String professorName,
      required String course,
    }) {
  final (:name, :departments) = uni;

  bool departmentFound = false;
  bool professorFound = false;

  final updatedDepartments = departments.map((dept) {
    final (name: dName, professors: profs) = dept;

    if (dName != deptName) return dept;
    departmentFound = true;

    final updatedProfs = profs.map((prof) {
      final (name: pName, courses: courses) = prof;

      if (pName != professorName) return prof;
      professorFound = true;

      if (courses.contains(course)) return prof;

      final updatedCourses = [...courses, course];
      return (name: pName, courses: updatedCourses);
    }).toList();

    return (name: dName, professors: updatedProfs);
  }).toList();

  if (!departmentFound || !professorFound) return uni;

  return (name: name, departments: updatedDepartments);
}

void printUniversity(University uni) {
  final (:name, :departments) = uni;

  print("== University: $name ==");

  for (final dept in departments) {
    final (name: deptName, professors: profs) = dept;
    print("- Department: $deptName");

    if (profs.isEmpty) {
      print("  (no professors)");
      continue;
    }

    for (final prof in profs) {
      final (name: profName, courses: courses) = prof;
      print("  * Professor: $profName");

      if (courses.isEmpty) {
        print("    Courses: (none)");
      } else {
        print("    Courses: ${courses.join(', ')}");
      }
    }
  }
}

void main() {
  University uni = (name: "PDP University", departments: <Department>[]);

  uni = addDepartment(uni, "Computer Science");
  uni = addDepartment(uni, "Mathematics");

  uni = addProfessor(uni, deptName: "Computer Science", professorName: "Dr. Alice");
  uni = addProfessor(uni, deptName: "Computer Science", professorName: "Dr. Bob");
  uni = addProfessor(uni, deptName: "Mathematics", professorName: "Dr. Carol");

  uni = addCourse(uni, deptName: "Computer Science", professorName: "Dr. Alice", course: "Dart Programming");
  uni = addCourse(uni, deptName: "Computer Science", professorName: "Dr. Alice", course: "Algorithms");
  uni = addCourse(uni, deptName: "Computer Science", professorName: "Dr. Bob", course: "Databases");
  uni = addCourse(uni, deptName: "Mathematics", professorName: "Dr. Carol", course: "Calculus");

  printUniversity(uni);
}
