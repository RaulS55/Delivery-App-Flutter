class Dish {
  final int id, counter;
  final String name, photo, description;
  final double price, rate;
  final String? tag;

  Dish({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.price,
    required this.rate,
    this.counter = 0,
    this.tag,
  });

  Dish updateCounter(int counter, {String? newTag}) {
    return Dish(
        id: id,
        name: name,
        photo: photo,
        description: description,
        price: price,
        rate: rate,
        tag: newTag,
        counter: counter);
  }
}
