class CatalogModel{
  static final items =[Item(
      id: 1,
      name: "iphone 12 pro",
      desc: "Apple iphone 12th gen",
      price: 999,
      color: "33505a",
      image: "https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/71hIfcIPyxS._SX679_.jpg",
  )
  ];
}


class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}
