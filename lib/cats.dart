import 'package:angular/angular.dart';
import 'src/get_items.dart';

/// Creates angular components (items and modules).
@Component(
  selector: 'cats',
  template: '''
<div id="cat_items">
  <ul class="cat_items_list">
    <li class="cat_item" *ngFor="let cat of cats">
      <a href="kategorie.html?c={{cat.id}}"><img class="cat_image" src="{{cat.image}}"></a>
      <div class="cat_desc">
        <a href="kategorie.html?c={{cat.id}}">{{cat.title}}</a><br>
        {{cat.desc}}
      </div>
    </li>
  </ul>
</div>

<div id="cat_modules">
  <div class="cat_module_row">
    <div class="cat_module" *ngFor="let cat of cats">
      <a href="kategorie.html?c={{cat.id}}"><img class="cat_image" src="{{cat.image}}"><br>
      {{cat.title}}</a>
    </div>
  </div>
</div>''',
  directives: [coreDirectives],
)
class AppComponent implements OnInit {
  List<Cat> cats;

  // get cats async
  @override
  ngOnInit() async {
    cats = await Cats().get_cats();
  }
}
