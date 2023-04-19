import 'package:flutter/material.dart';

// APP DATA
const String appName = "Weather App";
const String imgLogo = "assets/images/circle-icons-weather.png";
const String imgLogoUncircled = "assets/images/weather_icon.png";

// API
const String restWeatherApiKey = "2a63928ffc5d230c155fbafe5fbf779f";

// STATUS HTTP
const int okStatus = 200;
const int createdStatus = 201;
const int noContentStatus = 204;
const int badRequestStatus = 400;
const int foundStatus = 302;
const int notAuthorizedStatus = 403;
const int notFoundStatus = 404;
const int internalErrorStatus = 500;

// TIMES
const Duration connectTimeout = Duration(milliseconds: 30000);
const Duration receiveTimeout = Duration(milliseconds: 25000);

// ERRORS
const String occuredErrorMessage = 'An error occured, try again later.';
const String connectionErrorMessage = 'Connection error, try again later.';

// COLORS
const Color primaryColor = Color(0x14306FFF);
