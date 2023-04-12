class Episode {
  final String id, title, rating, date;

  Episode.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
