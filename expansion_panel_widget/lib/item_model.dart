import 'package:flutter/material.dart';

class ItemModel{
  bool? expanded;
  final String? headerItem;
  final String? description;
  final Color? colorItem;

  ItemModel({
    this.expanded,
    this.headerItem,
    this.description,
    this.colorItem,
});
}