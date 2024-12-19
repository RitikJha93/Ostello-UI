class Qna {
  String? username;
  String? question;
  String? details;
  int? noOfReplies;
  String? name;
  DateTime? date;
  List<Replies>? replies;

  Qna(
      {this.username = "@student name",
      required this.question,
      required this.details,
      this.noOfReplies = 0,
      this.name,
      this.date,
      this.replies});
}

class Replies {
  String? details;
  String? name;
  DateTime? date;

  Replies({required this.details, this.name, this.date});
}
