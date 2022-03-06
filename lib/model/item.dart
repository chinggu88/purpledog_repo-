class detail_story {
  String? by;
  int? descendants;
  int? id;
  List<int>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  detail_story(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.score,
      this.time,
      this.title,
      this.type,
      this.url});

  detail_story.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    kids = json['kids'].cast<int>();
    score = json['score'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['descendants'] = this.descendants;
    data['id'] = this.id;
    data['kids'] = this.kids;
    data['score'] = this.score;
    data['time'] = this.time;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class detail_comment {
  String? by;
  int? id;
  List<int>? kids;
  int? parent;
  String? text;
  int? time;
  String? type;

  detail_comment(
      {this.by,
      this.id,
      this.kids,
      this.parent,
      this.text,
      this.time,
      this.type});

  detail_comment.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    id = json['id'];
    kids = json['kids'].cast<int>();
    parent = json['parent'];
    text = json['text'];
    time = json['time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['id'] = this.id;
    data['kids'] = this.kids;
    data['parent'] = this.parent;
    data['text'] = this.text;
    data['time'] = this.time;
    data['type'] = this.type;
    return data;
  }
}

class detail_job {
  String? by;
  int? id;
  int? score;
  String? text;
  int? time;
  String? title;
  String? type;
  String? url;

  detail_job(
      {this.by,
      this.id,
      this.score,
      this.text,
      this.time,
      this.title,
      this.type,
      this.url});

  detail_job.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    id = json['id'];
    score = json['score'];
    text = json['text'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['id'] = this.id;
    data['score'] = this.score;
    data['text'] = this.text;
    data['time'] = this.time;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class detail_poll {
  String? by;
  int? descendants;
  int? id;
  List<int>? kids;
  List<int>? parts;
  int? score;
  String? text;
  int? time;
  String? title;
  String? type;

  detail_poll(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.parts,
      this.score,
      this.text,
      this.time,
      this.title,
      this.type});

  detail_poll.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    kids = json['kids'].cast<int>();
    parts = json['parts'].cast<int>();
    score = json['score'];
    text = json['text'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['descendants'] = this.descendants;
    data['id'] = this.id;
    data['kids'] = this.kids;
    data['parts'] = this.parts;
    data['score'] = this.score;
    data['text'] = this.text;
    data['time'] = this.time;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}

class detail_pollopt {
  String? by;
  int? id;
  int? poll;
  int? score;
  String? text;
  int? time;
  String? type;

  detail_pollopt(
      {this.by,
      this.id,
      this.poll,
      this.score,
      this.text,
      this.time,
      this.type});

  detail_pollopt.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    id = json['id'];
    poll = json['poll'];
    score = json['score'];
    text = json['text'];
    time = json['time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['id'] = this.id;
    data['poll'] = this.poll;
    data['score'] = this.score;
    data['text'] = this.text;
    data['time'] = this.time;
    data['type'] = this.type;
    return data;
  }
}
