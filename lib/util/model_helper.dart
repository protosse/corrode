int dynamicToInt(dynamic json) {
  if (json is int) {
    return json;
  } else {
    return int.tryParse(json) ?? 0;
  }
}

String dynamicToString(dynamic json) {
  if (json is String) {
    return json;
  } else {
    return "$json";
  }
}
