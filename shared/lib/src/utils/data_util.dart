class DataUtil {
  static double mapNumberToDouble(dynamic value) {
    return (value != null) ? numberToDouble(value) : value;
  }

  static double? mapNullableNumberToDouble(dynamic value) {
    return (value != null) ? numberToDouble(value) : value;
  }

  static double numberToDouble(dynamic value) {
    return (value is int) ? value.toDouble() : value;
  }
}
