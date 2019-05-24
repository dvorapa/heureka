import "dart:async";
import 'dart:convert' as JSON;
import 'dart:html';

/// Gets anything from API. (so called The Big Getter)
/// 
/// @param query: query to be loaded from API
/// @type query: String
class Getter {
  // instantiate empty request
  String query;

  // initializer
  Getter(this.query);

  // get raw json
  Future<dynamic> get_json () async {
    // async completer
    Completer c = Completer();
    // API url
    String url = 'http://python-servers-vtnovk529892.codeanyapp.com:5000/$query';
    // request raw result
    String raw = await HttpRequest.getString(url);
    // jsonify
    List<dynamic> json = JSON.jsonDecode(raw);
    // async return
    c.complete(json);
    return c.future;
  }
}

/// Gets categories from The Big Getter.
class Cats {
  // instantiate cat request
  String query = 'categories';

  // instantiate empty list
  List<Cat> cats = [];

  // compile new list of cats
  Future<dynamic> get_cats () async {
    // async completer
    Completer c = Completer();
    // instantiate request
    Getter request = Getter(query);
    // request json
    List json = await request.get_json();
    // fill list
    json.forEach((map){
      cats.add(Cat(map['categoryId'], map['title']));
    });
    // async return
    c.complete(cats);
    return c.future;
  }
}

/// Category class.
/// 
/// @param id: id of category
/// @type id: int
/// @param title: title of category
/// @type title: String
/// @param image: url of category image
/// @type image: String
/// @param desc: description of category
/// @type desc: String
class Cat {
  // initialize class
  int id;
  String title;
  Cat(this.id, this.title);

  // no support in API? todo?
  String image = 'neznam.png';
  String desc = 'popis';
}
