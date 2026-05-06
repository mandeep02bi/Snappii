import 'package:flutter/material.dart';

double rh(BuildContext context, double h) =>
    MediaQuery.of(context).size.height * h;

double rw(BuildContext context, double w) =>
    MediaQuery.of(context).size.width * w;
