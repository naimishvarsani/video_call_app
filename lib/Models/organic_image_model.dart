class OrganicImage {
  List<AllOrganicImage>? data;

  OrganicImage({this.data});

  OrganicImage.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AllOrganicImage>[];
      json['data'].forEach((v) {
        data!.add(new AllOrganicImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllOrganicImage {
  String? name;
  String? image;
  String? country;
  int? age;
  String? gender;

  AllOrganicImage({this.name, this.image, this.country, this.age, this.gender});

  AllOrganicImage.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    country = json['country'];
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['country'] = this.country;
    data['age'] = this.age;
    data['gender'] = this.gender;
    return data;
  }
}
