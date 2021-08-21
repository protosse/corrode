int dynamicToInt(dynamic json) {
  if (json == null) {
    return 0;
  } else if (json is int) {
    return json;
  } else {
    return int.tryParse(json) ?? 0;
  }
}

String dynamicToString(dynamic json) {
  if (json == null) {
    return "";
  } else if (json is String) {
    return json;
  } else {
    return "$json";
  }
}
