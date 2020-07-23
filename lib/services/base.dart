abstract class ServiceBase{
  String apUrl = "";


}

class ApiInterface
{
  dynamic get(int id){}
  dynamic getAll(){}
  bool save(Object obj){}
  bool update(Object obj, int id){}
  bool delete(int id){}
}
