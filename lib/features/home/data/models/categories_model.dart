class CategoriesModel {
  final String name ;
  final String? slug;
  final String? url;

  CategoriesModel({required this.name, this.slug,this.url});
  factory CategoriesModel.fromJson(Map<String,dynamic> json){
    return CategoriesModel(
        name: json['name'],
      slug: json['slug'],
      url: json['url'],
    );
  }
}