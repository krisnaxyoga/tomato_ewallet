class TipModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnail;

  TipModel({this.id, this.title, this.thumbnail, this.url});

  factory TipModel.fromJson(Map<String, dynamic> json) => TipModel(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnail: json['thumbnail'],
      );
}
