import 'package:json_annotation/json_annotation.dart';
// uretilmesi icin sunu yapmaliyiz:
// BUild runner benim icin butun projeyi gezip, gelistiri. 
// eger ihtiyaci olan varsa kod uretimi yapiyor.
// yani mesela bu model'e yeni bir ozellik ekledim. Part of 'u olan resource_model.g.dart'a gidip yine aynisini eklemiyorum.
// bunu build runner hallediyor.
part 'resource_model.g.dart';

String _fetchCustom(String data) {
  return 'aa';
}
// hangi class'larin uretimi yapilacaksa onlarin basina jsonserializable yaziyoruz.
@JsonSerializable(createToJson: false)
// tojson'i false yapinca artik bunlarin metotlarina da ihtiyac kalmayacak.
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

 factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   return _$ResourceModelToJson(this);
  // }
}

@JsonSerializable(
)
class Data {
  final int? id;
  final String? name;
  final int? year;
  // renk farkli gelirse
  //@JsonKey(name: 'renk')
  final String? color;
  // fyat bilgisi farkli gelebilir..
  // yani bana servisten pantpneValue'ye geleni anlayip oraya parametre olarak datayi atiyor.
  @JsonKey(fromJson: _fetchCustom)
  final String? pantoneValue;
  final String? price;
  final StatusCode? status;

  Data(this.status, {this.id, this.name, this.year, this.color, this.pantoneValue,this.price});

  // 5. Buraya color'in bir metodu olmali.
  // benim color tipime veya integer'a cevirecek bir sey olmali.
// ve bu metod computed calisacak. Yani cagrildiginda bub deger calisacak om-nun icin getter yaziyorum.
// Oncelikle renk kodunda #'ten kurtulmam lazim..
// Ama eger bu colorValue metodu global oldduysa product altinda extensions klasoru altina tasi.

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   return _$DataToJson(this);
  // }
}

enum StatusCode{
  @JsonValue(200)
   success,
  @JsonValue(500) weird,
  
}
