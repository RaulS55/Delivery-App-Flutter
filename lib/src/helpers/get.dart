class Get {
  Get._();
  static Get i = Get._();

  final Map<String, dynamic> _data = {}; //Aqui se guardaran las dependencias

  String _getKey(Type t, String? tag) {
    if (tag != null) {
      return "${t.toString()}$tag";
    } else {
      return t.toString();
    }
  }

  void put<T>(dynamic dependency, {String? tag}) {
    final String key = _getKey(T, tag);
    _data[key] = dependency;
  }

  T find<T>({String? tag}) {
    final String key = _getKey(T, tag);
    if (!_data.containsKey(key)) {
      throw AssertionError("$key no found");
    }
    return _data[key];
  }

  void remuve<T>({String? tag}) {
    final String key = _getKey(T, tag);
    _data.remove(key);
  }
}
