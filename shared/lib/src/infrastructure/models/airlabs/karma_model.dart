class KarmaModel {
  final bool isBlocked;
  final bool isCrawler;
  final bool isBot;
  final bool isFriend;
  final bool isRegular;

  KarmaModel({
    this.isBlocked = false,
    this.isCrawler = false,
    this.isBot = false,
    this.isFriend = false,
    this.isRegular = false,
  });

  factory KarmaModel.fromJson(Map<String, dynamic> json) => KarmaModel(
        isBlocked: json['is_blocked'],
        isCrawler: json['is_crawler'],
        isBot: json['is_bot'],
        isFriend: json['is_friend'],
        isRegular: json['is_regular'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['is_blocked'] = isBlocked;
    json['is_crawler'] = isCrawler;
    json['is_bot'] = isBot;
    json['is_friend'] = isFriend;
    json['is_regular'] = isRegular;
    return json;
  }
}
