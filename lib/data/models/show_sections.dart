class ShowSections {
List<String>? sectionNumbers;
String? messsage;

ShowSections({this.sectionNumbers, this.messsage});

ShowSections.fromJson(Map<String, dynamic> json) {
sectionNumbers = json['section_numbers'].cast<String>();
messsage = json['messsage'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['section_numbers'] = this.sectionNumbers;
data['messsage'] = this.messsage;
return data;
}
}
