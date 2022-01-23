class ConversorModel {
  Results? results;

  ConversorModel({
    this.results,
  });

  ConversorModel.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  Currencies? currencies;

  Results({required this.currencies});

  Results.fromJson(Map<String, dynamic> json) {
    currencies = json['currencies'] != null
        ? Currencies.fromJson(json['currencies'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currencies != null) {
      data['currencies'] = currencies!.toJson();
    }
    return data;
  }
}

class Currencies {
  String? source;
  USD? uSD;
  EUR? eUR;

  Currencies({
    this.uSD,
    this.eUR,
  });

  Currencies.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
    eUR = json['EUR'] != null ? EUR.fromJson(json['EUR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    if (eUR != null) {
      data['EUR'] = eUR!.toJson();
    }

    return data;
  }
}

class USD {
  String? name;
  double? buy;

  USD({this.name, this.buy});

  USD.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    buy = json['buy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['buy'] = buy;
    return data;
  }
}

class EUR {
  String? name;
  double? buy;

  EUR({
    this.name,
    this.buy,
  });

  EUR.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    buy = json['buy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['buy'] = buy;
    return data;
  }
}
