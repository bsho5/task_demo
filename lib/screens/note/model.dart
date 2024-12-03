import 'dart:convert';

class NoteModel {
  String? body;
  String? id;
  NoteModel({
    this.body,
    this.id,
  });

  NoteModel copyWith({
    String? body,
    String? id,
  }) {
    return NoteModel(
      body: body ?? this.body,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(body != null){
      result.addAll({'body': body});
    }
    if(id != null){
      result.addAll({'id': id});
    }
  
    return result;
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      body: map['body'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source));

  @override
  String toString() => 'NoteModel(body: $body, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NoteModel &&
      other.body == body &&
      other.id == id;
  }

  @override
  int get hashCode => body.hashCode ^ id.hashCode;
}
