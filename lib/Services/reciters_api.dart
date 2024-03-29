import 'dart:convert';
import 'package:http/http.dart' as http;
class ReciterAudio {

  static Future<ReciterAudio> fetchReciterAudio() async {
    final response = await http.get(Uri.parse('https://www.mp3quran.net/api/v3/reciters?language=eng'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return ReciterAudio.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load reciter audio');
    }
  }


  List<Reciters>? reciters;

  ReciterAudio({this.reciters});

  ReciterAudio.fromJson(Map<String, dynamic> json) {
    if (json['reciters'] != null) {
      reciters = <Reciters>[];
      json['reciters'].forEach((v) {
        reciters!.add(Reciters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reciters != null) {
      data['reciters'] = reciters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reciters {
  int? id;
  String? name;
  String? letter;
  List<Moshaf>? moshaf;

  Reciters({this.id, this.name, this.letter, this.moshaf});

  Reciters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    letter = json['letter'];
    if (json['moshaf'] != null) {
      moshaf = <Moshaf>[];
      json['moshaf'].forEach((v) {
        moshaf!.add(Moshaf.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['letter'] = letter;
    if (moshaf != null) {
      data['moshaf'] = moshaf!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Moshaf {
  int? id;
  String? name;
  String? server;
  int? surahTotal;
  int? moshafType;
  String? surahList;

  Moshaf(
      {this.id,
        this.name,
        this.server,
        this.surahTotal,
        this.moshafType,
        this.surahList});

  Moshaf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    server = json['server'];
    surahTotal = json['surah_total'];
    moshafType = json['moshaf_type'];
    surahList = json['surah_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['server'] = server;
    data['surah_total'] = surahTotal;
    data['moshaf_type'] = moshafType;
    data['surah_list'] = surahList;
    return data;
  }
}
