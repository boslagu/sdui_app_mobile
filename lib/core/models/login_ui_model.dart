// class LoginUI {
//   String code = '';
//   String message = '';
//   Data data = Data(
//     fields: <Fields>[],
//     verion: '0',
//   );
//
//   LoginUI({
//     required this.code,
//     required this.message,
//     required this.data,
//   });
//
//   LoginUI.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//     data = Data.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['message'] = this.message;
//     data['data'] = this.data.toJson();
//     return data;
//   }
// }
//
// class Data {
//   List<Fields> fields = <Fields>[];
//   String verion = '';
//
//   Data({
//     required this.fields,
//     required this.verion,
//   });
//
//   Data.fromJson(Map<String, dynamic> json) {
//     fields = <Fields>[];
//     json['fields'].forEach((v) {
//       fields!.add(new Fields.fromJson(v));
//     });
//     verion = json['verion'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['fields'] = this.fields!.map((v) => v.toJson()).toList();
//     data['verion'] = this.verion;
//     return data;
//   }
// }
//
// class Fields {
//   String fieldName = '';
//   String fieldType = '';
//   bool isShown = false;
//   List<Options> options = <Options>[];
//   Design design = Design(
//     color: '',
//     fontsize: 0,
//     padding: 0,
//     visibility: '',
//   );
//
//   Fields({
//     required this.fieldName,
//     required this.fieldType,
//     required this.isShown,
//     required this.options,
//     required this.design,
//   });
//
//   Fields.fromJson(Map<String, dynamic> json) {
//     fieldName = json['fieldName'];
//     fieldType = json['fieldType'];
//     isShown = json['isShown'];
//     options = <Options>[];
//     json['options'].forEach((v) {
//       options!.add(new Options.fromJson(v));
//     });
//     design = Design.fromJson(json['design']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['fieldName'] = this.fieldName;
//     data['fieldType'] = this.fieldType;
//     data['isShown'] = this.isShown;
//     data['options'] = this.options.map((v) => v.toJson()).toList();
//     data['design'] = this.design.toJson();
//     return data;
//   }
// }
//
// class Options {
//   String optiontitle = '';
//   int optionlist = 0;
//
//   Options({
//     required this.optiontitle,
//     required this.optionlist,
//   });
//
//   Options.fromJson(Map<String, dynamic> json) {
//     optiontitle = json['optiontitle'];
//     optionlist = json['optionlist'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['optiontitle'] = this.optiontitle;
//     data['optionlist'] = this.optionlist;
//     return data;
//   }
// }
//
// class Design {
//   String color = '';
//   int fontsize = 0;
//   int padding = 0;
//   String visibility = '';
//
//   Design({
//     required this.color,
//     required this.fontsize,
//     required this.padding,
//     required this.visibility,
//   });
//
//   Design.fromJson(Map<String, dynamic> json) {
//     color = json['color'];
//     fontsize = json['fontsize'];
//     padding = json['padding'];
//     visibility = json['visibility'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['color'] = this.color;
//     data['fontsize'] = this.fontsize;
//     data['padding'] = this.padding;
//     data['visibility'] = this.visibility;
//     return data;
//   }
// }

class LoginUI {
  String? code;
  String? message;
  Data? data;

  LoginUI({this.code, this.message, this.data});

  LoginUI.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Fields>? fields;
  String? version;

  Data({this.fields, this.version});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(new Fields.fromJson(v));
      });
    }
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fields != null) {
      data['fields'] = this.fields!.map((v) => v.toJson()).toList();
    }
    data['version'] = this.version;
    return data;
  }
}

class Fields {
  String? fieldName;
  String? fieldType;
  String? widgetType;
  bool? isShown;
  bool? isEnabled;
  List<Options>? options;
  Design? design;

  Fields({this.fieldName, this.fieldType, this.isShown, this.options, this.design, this.isEnabled, this.widgetType});

  Fields.fromJson(Map<String, dynamic> json) {
    fieldName = json['fieldName'];
    fieldType = json['fieldType'];
    isShown = json['isShown'];
    widgetType = json['widgetType'];
    isEnabled = json['isEnabled'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    design = json['design'] != null ? new Design.fromJson(json['design']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldName'] = this.fieldName;
    data['fieldType'] = this.fieldType;
    data['widgetType'] = this.widgetType;
    data['isShown'] = this.isShown;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.design != null) {
      data['design'] = this.design!.toJson();
    }
    return data;
  }
}

class Options {
  String? optiontitle;
  int? optionlist;

  Options({this.optiontitle, this.optionlist});

  Options.fromJson(Map<String, dynamic> json) {
    optiontitle = json['optiontitle'];
    optionlist = json['optionlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['optiontitle'] = this.optiontitle;
    data['optionlist'] = this.optionlist;
    return data;
  }
}

class Design {
  String? color;
  int? fontsize;
  int? padding;
  String? visibility;

  Design({this.color, this.fontsize, this.padding, this.visibility});

  Design.fromJson(Map<String, dynamic> json) {
    color = json['hexColor'];
    fontsize = json['fontsize'];
    padding = json['padding'];
    visibility = json['visibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hexColor'] = this.color;
    data['fontsize'] = this.fontsize;
    data['padding'] = this.padding;
    data['visibility'] = this.visibility;
    return data;
  }
}
