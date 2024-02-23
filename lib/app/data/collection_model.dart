class Collection {
  int? id;
  String? uuid;
  String? title;
  String? creator;
  String? date;
  String? description;
  String? image;
  String? url;
  String? createdAt;
  String? updatedAt;

  Collection(
      {this.id,
      this.uuid,
      this.title,
      this.creator,
      this.date,
      this.description,
      this.image,
      this.url,
      this.createdAt,
      this.updatedAt});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    title = json['title'];
    creator = json['creator'];
    date = json['date'];
    description = json['description'];
    image = json['image'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['title'] = this.title;
    data['creator'] = this.creator;
    data['date'] = this.date;
    data['description'] = this.description;
    data['image'] = this.image;
    data['url'] = this.url;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
