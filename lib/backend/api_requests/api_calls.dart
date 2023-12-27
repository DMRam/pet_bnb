import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeocodeAPICall {
  static Future<ApiCallResponse> call({
    String? address = '739 rue roberge sherbrooke',
    String? apiKey = 'AIzaSyCuTHCM866oQ7LBGF6KCPHzEpnTjMW5-1g',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Geocode API',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static double? apiLat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0]..bounds.northeast.lat''',
      ));
  static double? apiLng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0]..bounds.northeast.lng''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
