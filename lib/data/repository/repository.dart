import 'package:rw_courses/data/index.dart';

//Định nghĩa sẵn các hành vi mong muốn cho tầng Repository
abstract class Repository {
  //Hàm trả về danh sách khoá học
  //Tham số domainFilter => Lọc khoá học
  Future<List<Course>> getCourses(int domainFilter);
}
