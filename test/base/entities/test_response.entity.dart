// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum TestResponseStatus { valid, invalid }

class TestResponse {
  TestResponseStatus status;
  String? message;
  String name;
  DateTime? date;
  TestResponse({
    this.status = TestResponseStatus.invalid,
    this.message,
    this.date,
    required this.name,
  });

  TestResponse copyWith({
    TestResponseStatus? status,
    String? message,
    String? name,
    DateTime? date,
  }) {
    return TestResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      name: name ?? this.name,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.index,
      'message': message,
      'name': name,
      'date': date?.millisecondsSinceEpoch,
    };
  }

  factory TestResponse.fromMap(Map<String, dynamic> map) {
    return TestResponse(
      status: map['status'] != null
          ? TestResponseStatus.values[map['status'] as int]
          : TestResponseStatus.invalid,
      message: map['message'] as String,
      name: map['name'] as String,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
    );
  }

  Map<String, dynamic> toJson() => (toMap());

  factory TestResponse.fromJson(String source) =>
      TestResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'TestResponse(status: $status, message: $message, name: $name, date: $date)';

  @override
  bool operator ==(covariant TestResponse other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.name == name;
  }

  @override
  int get hashCode =>
      status.hashCode ^ message.hashCode ^ status.hashCode ^ date.hashCode;
}
