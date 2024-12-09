

void extendsTest(){
  Dog dog = Dog("흰둥이", 6);
  dog.eat();
}

// 부모 클래스
class Animal {
  String _name;

  Animal(this._name);

  void eat(){
    print("$_name 이(가) 밥을 먹습니다.");
  }
}

// 자식 클래스
class Dog extends Animal {
  late int _age;    // late 는 나중에 초기화, ? 는 null 허용

  Dog(String name, int age) : super(name){    // :는 초기화 리스트 실행 name 은 부모 생성자에 넣어주고 이후에 자기 자신 setter에 age 넣어줌...
    this.age = age;
  }

  int get age => _age;

  set age(int value) {
    if(value <= 0){
      throw ArgumentError("나이가 너무 어려요");
    }
    _age = value;
  }
}