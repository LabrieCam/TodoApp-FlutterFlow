import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendEmailToUserCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? subject = 'Welcome to Todo App!',
    String? text =
        'Here\'s a quick overview of what you can do with todo app: Create and Manage Tasks: Easily add new tasks and organize them into lists. Set due dates and priorities to keep track of what\'s important. Cross-Device Sync: Access your to-do lists from any device. Whether you\'re on your phone, tablet, or computer, your tasks are always up-to-date. Reminders and Notifications: Never miss a deadline with our customizable reminders. Get notified about upcoming tasks and stay on top of your schedule. Collaborate with Others: Share your lists with friends, family, or colleagues. Work together on projects and keep everyone in the loop. Customizable Themes: Personalize your app experience with a variety of themes and color options to suit your style. We\'re committed to providing you with the best experience possible. If you have any questions or need assistance, feel free to reach out to our support team at [support email address]. Thank you for choosing [Your Todo App Name]. We look forward to helping you achieve your goals! Best regards, The Todo App team ',
  }) async {
    final ffApiRequestBody = '''
{
  "to": "$to",
  "subject": "$subject",
  "text": "$text"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmailToUser',
      apiUrl:
          'https://us-central1-week5-sendgrid-2e13b.cloudfunctions.net/sendEmailToUser',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
