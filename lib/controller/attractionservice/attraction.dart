import 'package:city_guide_app/model/attractions_model.dart';

final List<Attraction> attractionlist = [];

void sort(List<Attraction> attractionlist) {
  attractionlist.sort((a, b) => a.distance.compareTo(b.distance));
}
