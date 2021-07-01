class Person {
  late final String name;
  late final String des;
  late final bool iscompelete;
  late final bool isgive;
  Person({
    required this.name,
    required this.des,
    required this.iscompelete,
    required this.isgive,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.name == name &&
        other.des == des &&
        other.iscompelete == iscompelete &&
        other.isgive == isgive;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        des.hashCode ^
        iscompelete.hashCode ^
        isgive.hashCode;
  }

  @override
  String toString() {
    return 'Person(name: $name, des: $des, iscompelete: $iscompelete, isgive: $isgive)';
  }
}
