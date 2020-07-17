import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.github.com/';
  static String client_id = '47a970a0d1b438d0754b';
  static String client_secret = 'b5a7fceae41be406ad8203cc8985cb1b44ab62a5';

  final String query = "?client_id=${client_id}&client_secret=${client_secret}";

  Github(this.userName);

  Future<http.Response> fetchUser() {
    return http.get(url + 'users/' + userName + query);
  }

  Future<http.Response> fetchFollowing() {
    return http.get(url + 'users/' + userName + '/following' + query); // https://api.github.com/users/sayannath/following
  }
}
