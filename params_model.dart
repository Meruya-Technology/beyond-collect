 
 class ParamsModel {	final String lang;
 
 ParamsModel({		required this.lang,}); 

 factory ParamsModel.fromJson(
          Map<String, dynamic> json) => ParamsModel(lang : json['lang'],); 

 Map<String, dynamic> toJson() {
      final json = <String, dynamic>{}; json['lang'] = lang; return json;}}