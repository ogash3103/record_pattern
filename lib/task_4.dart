sealed class Shape {
  const Shape();
}

class Circle extends Shape {
  final double radius;
  const Circle(this.radius);
}


class Square extends Shape {
  final double side;
  const Square(this.side);
}

class Rectangle extends Shape {
  final double width;
  final double height;

  const Rectangle(this.width, this.height);
}

double areaOf(Shape shape) {
  return switch (shape) {
    Circle(radius: final r) => 3.14 * r  * r,
    Square(side: final s) => s * s,
  Rectangle(width: final w, height: final h) => w * h,
  };
}

double totalArea(List<Shape> shapes) {
  double sum = 0;

   for(final shape in shapes) {
     sum += areaOf(shape);
   }

   return sum;
}

void main() {
  final shapes = <Shape> [
    const Circle(3),
    const Square(4),
    const Rectangle(5, 8),
  ];

  final total = totalArea(shapes);
  print("Umumiy maydon: $total");
}