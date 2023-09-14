class Gif {
  String url;

  Gif({
    required this.url,
  });

  factory Gif.fromJson(Map<String, dynamic> map) {
    return Gif(url: map["media_formats"]["mediumgif"]["url"]);
  }
}
