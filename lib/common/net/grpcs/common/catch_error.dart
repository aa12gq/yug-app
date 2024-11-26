Map<String, dynamic> map = {};
void catchError(Object e) {
  String error = e.toString().substring(12, e.toString().length - 1);
  var t = error.replaceAll(RegExp(r"\s+\b|\b\s"), "");
  List<String> total = t.split(',');
  var code = total[0];
  var codeName = total[1];
  var message = total[2];
  List<String> l1 = code.split(':');
  List<String> l2 = codeName.split(':');
  List<String> l3 = message.split(':');
  map[l1[0]] = l1[1];
  map[l2[0]] = l2[1];
  map[l3[0]] = l3[1];
  print('network request error:$map');
}
