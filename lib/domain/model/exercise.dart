import 'package:flutter/material.dart';

class Exercise {
  final int id;
  int order;
  String orderPrefix;
  Color? color;

  Exercise({
    required this.id,
    required this.order,
    required this.orderPrefix,
    this.color,
  });

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      order: map['order'],
      orderPrefix: map['order_prefix'],
    );
  }

  Exercise copyWith({int? order, Color? color, String? orderPrefix}) {
    return Exercise(
      id: id,
      order: order ?? this.order,
      orderPrefix: orderPrefix ?? this.orderPrefix,
      color: color ?? this.color,
    );
  }

  void setColor(Color clr) {
    color = clr;
  }

  @override
  String toString() {
    return 'id: $id';
  }
}
