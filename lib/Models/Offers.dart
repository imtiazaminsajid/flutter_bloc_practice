class Offers {
  int? id;
  String? title;
  String? slug;
  String ?status;
  int? adminId;
  String? createdAt;
  String? updatedAt;
  String? photo;
  String? photoUrl;

  Offers(
      {this.id,
        this.title,
        this.slug,
        this.status,
        this.adminId,
        this.createdAt,
        this.updatedAt,
        this.photo,
        this.photoUrl});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    status = json['status'];
    adminId = json['admin_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    photo = json['photo'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['admin_id'] = this.adminId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['photo'] = this.photo;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}