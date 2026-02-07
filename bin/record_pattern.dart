void main() {
  final point = createPoint(3.5, 7.2);
  printPoint(point);


  print('==========');

  final product1 = (name: "Telefon", price: 350.0);
  final product2 = (name: "Naushnik", price: 120.0);
  final cheap = cheaperProduct(product1, product2);

  print("Arzon mahsulot: ${cheap.name}, narxi: ${cheap.price}");
}

({double x, double y}) createPoint(double x, double y) {
  return (x: x, y: y);
}

void printPoint(({double x, double y}) point) {
  print("Nuqta koordinatoalari: x = ${point.x}, y = ${point.y}");
}


({String name, double price}) cheaperProduct (
({String name, double price}) p1,
({String name, double price}) p2,
) {
  if(p1.price <= p2.price) {
    return p1;
  } else {
    return p2;
  }
}