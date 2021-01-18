class SearchHandler {
  final bool success;
  final String source;
  final data;
  const SearchHandler(this.success, this.source, this.data);
}

class SearchSource {
  static String HOME_AFFAIRS = 'home_affairs';
  static String DEPARTMENT_OF_HEALTH = 'department_of_health';
  static String OUR_DB = 'our_db';
  static String NO_SOURCE = 'no_source';
}
