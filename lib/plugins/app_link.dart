import 'dart:async';
import 'dart:convert';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:yug_app/common/utils/log.dart';

import 'aliyun_push.dart';

/// applink 相关处理及页面跳转
Future<void> schemeJump(String schemeUrl) async {
  logDebug(schemeUrl);
  final tmpUri = Uri.parse(schemeUrl.replaceFirst(
    'veigitapp://',
    'https://',
  ));
  final path = tmpUri.path.toLowerCase();
  try {
    switch (path) {
      case "/plandetail": //跳转计划详情页
        Map<String, dynamic> params = await getParamsFromUrl(schemeUrl);
        final planId = $fixnum.Int64(int.parse(params['planId']));
        // 这里应该使用您的路由导航，暂时只记录日志
        logDebug("准备跳转计划详情页: planId = $planId");
        break;
      default:
        Map<String, dynamic> params = await getParamsFromUrl(schemeUrl);
        logDebug("未处理的scheme路径:$path 参数:$params");
    }
  } catch (e, s) {
    logDebug(e);
    logDebug(s);
  }
}

Future<Map<String, dynamic>> getParamsFromUrl(String url) async {
  Map<String, dynamic> paramsMap = {};
  try {
    Uri uri = Uri.parse(url.replaceFirst('vtyugapp://', 'https://'));
    paramsMap = uri.queryParameters;
  } catch (e, s) {
    logDebug(e);
    logDebug(s);
  }
  return paramsMap;
}
