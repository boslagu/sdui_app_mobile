// class ProductsModel {
//   // bool isAvailable;
//   String billerTag;
//   String description;
//   String category;
//   List<Fields> fields;
//   double serviceCharge;
//
//   ProductsModel({/*this.isAvailable,*/ this.billerTag, this.description, this.category, this.fields, this.serviceCharge});
//
//   ProductsModel.fromJson(Map<String, dynamic> json) {
//     // isAvailable = json['isAvailable'];
//     billerTag = json['productCode'];
//     description = json['name'];
//     category = json['category'];
//     if (json['fields'] != null) {
//       fields = new List<Fields>();
//       json['fields'].forEach((v) {
//         fields.add(new Fields.fromJson(v));
//       });
//     }
//     serviceCharge = double.parse(json['serviceCharge'].toString());
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     // data['isAvailable'] = this.isAvailable;
//     data['productCode'] = this.billerTag;
//     data['name'] = this.description;
//     data['category'] = this.category;
//     if (this.fields != null) {
//       data['fields'] = this.fields.map((v) => v.toJson()).toList();
//     }
//     data['serviceCharge'] = this.serviceCharge;
//     return data;
//   }
// }
//
// class Fields {
//   String key;
//   String title;
//   String format;
//   int width;
//   List<Options> options;
//
//   Fields({this.key, this.title, this.format, this.width, this.options});
//
//   Fields.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     title = json['title'];
//     format = json['format'];
//     width = json['width'];
//     if (json['options'] != null) {
//       options = new List<Options>();
//       json['options'].forEach((v) {
//         options.add(new Options.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['title'] = this.title;
//     data['format'] = this.format;
//     data['width'] = this.width;
//     if (this.options != null) {
//       data['options'] = this.options.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Options {
//   String title;
//   String value;
//
//   Options({this.title, this.value});
//
//   Options.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     value = json['value'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['value'] = this.value;
//     return data;
//   }
// }

void some() {
  var a = {
    "code": "00",
    "message": "Welcome to Service Driven UI.",
    "data": {
      "fields": [
        {
          "fieldName": "Sample Hint",
          "fieldType": "text",
          "widgetType": "textField",
          "isShown": true,
          "isEnabled": false,
          "options": [
            {"optiontitle": "test", "optionlist": 1},
            {"optiontitle": "test", "optionlist": 2}
          ],
          "design": {"hexColor": "1E90FF", "fontsize": 1, "padding": 2, "visibility": "true"}
        },
        {
          "fieldName": "Another Hint",
          "fieldType": "text",
          "widgetType": "textField",
          "isShown": true,
          "isEnabled": true,
          "options": [
            {"optiontitle": "test", "optionlist": 1},
            {"optiontitle": "test", "optionlist": 2}
          ],
          "design": {"hexColor": "228B22", "fontsize": 1, "padding": 2, "visibility": "false"}
        },
        {
          "fieldName": "This is a Button",
          "fieldType": "text",
          "widgetType": "textButton",
          "isShown": true,
          "isEnabled": true,
          "options": [
            {"optiontitle": "test", "optionlist": 1},
            {"optiontitle": "test", "optionlist": 2}
          ],
          "design": {"hexColor": "228B22", "fontsize": 1, "padding": 2, "visibility": "false"}
        }
      ],
      "verion": "v1.0"
    }
  };
}
