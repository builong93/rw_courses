//Các hằng số cài đăt, cấu hình, biến tĩnh được sử dụng xuyên suốt trong ứng dụng
class Constants {
  //RW API
  static const String rwAPI =
      'https://api.raywenderlich.com/api/contents?filter[content_types][]=collection';
  //Giá trị từ RW API
  static const String iosDomain = '1';
  static const String androidDomain = '2';
  static const String unityDomain = '3';
  static const String macOSDomain = '5';
  static const String archivedDomain = '6';
  static const String sssDomain = '8';
  static const String flutterDomain = '9';

  //Giá trị được lưu trong preferences
  static const int iosFilter = 1;
  static const int androidFilter = 2;
  static const int unityFilter = 3;
  static const int macOSFilter = 5;
  static const int sssFilter = 8;
  static const int flutterFilter = 9;
  static const int allFilter = 0;
  static const int otherFilter = -1;

  static const String filterKey = 'FILTER_KEY';
}
