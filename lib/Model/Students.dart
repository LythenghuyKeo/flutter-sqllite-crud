class Student{
  String?id;
  String?name;
  int?year;
  int? age;
  String? phoneNumber;

  Student({required this.id,required this.name,required this.year});
  StudentMap(){
    var student_mapped = Map<String,dynamic>();
    student_mapped["id"]=id;
    student_mapped["name"]=name;
    student_mapped["age"]=age;
    student_mapped["year"]=this.year;
    student_mapped["phoneNumber"]=phoneNumber;
    return student_mapped;
  }


}