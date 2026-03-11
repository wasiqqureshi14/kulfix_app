class ProviderModel {
  final String id;
  final String fullName;
  final String profileImage;
  final double rating;
  final int totalReviews;
  final String companyName;

  ProviderModel({
    required this.id,
    required this.fullName,
    required this.profileImage,
    required this.rating,
    required this.totalReviews,
    required this.companyName,
  });

 factory ProviderModel.fromMap(Map<String, dynamic> map) {
  return ProviderModel(
    id: map['provider_id'],
    fullName: map['full_name'],
    profileImage: map['profile_image'] ?? '',
    rating: (map['rating'] ?? 0).toDouble(),
    totalReviews: (map['total_reviews'] ?? 0).toInt(),
    companyName: map['company_name'] ?? '',
  );
}
}