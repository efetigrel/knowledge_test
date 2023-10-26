void main() {
  Insan yetiskin_1 = Insan();
  Bebek bebek_1 = Bebek();
  Yasli yasli_1 = Yasli();

  yetiskin_1.uyu();
  bebek_1.uyu();
  yasli_1.uyu();
}

class Insan {
  String? ad;
  int? yas;

  void uyu() {
    print("8 saat uyurum");
  }
}

class Bebek extends Insan {
  @override
  void uyu() {
    print("20 saat uyurum");
  }

  void agla() {
    print("ağlıyorum");
  }
}

class Yasli extends Insan {
  @override
  void uyu() {
    print("5 saat uyurum");
  }
}
