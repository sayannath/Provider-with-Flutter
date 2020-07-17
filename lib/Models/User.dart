class User {
  String login;
  String avatar_url;
  String html_url;

  User(this.login, this.avatar_url, this.html_url);

  Map toJson() =>
      {'login': login, 'avatar_url': avatar_url, 'html_url': html_url};

  User.fromJson(Map json)
      : login = json['login'],
        avatar_url = json['avatar_url'],
        html_url = json['html_url'];
}
