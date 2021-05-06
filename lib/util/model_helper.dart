int dynamicToInt(dynamic json) {
  if (json is String) {
    return int.tryParse(json) ?? 0;
  } else if (json is int) {
    return json;
  }
  return 0;
}

String dynamicToString(dynamic json) {
  if (json is String) {
    return json;
  } else if (json is int) {
    return "$json";
  }
  return "";
}
