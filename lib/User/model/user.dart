import 'package:flutter/material.dart';

class User {
  final String clave;
  final String name;
  final String job;
  final String active;
  final String link;


  User({
    Key key,
      this.clave,
      this.name,
      this.job,
      this.active,
      this.link,
  });
}