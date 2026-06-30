class CardItemModel {
  final String nameAr;
  final String nameEn;
  final String versesCount;

  CardItemModel({
    required this.nameAr,
    required this.nameEn,
    required this.versesCount,
  });
}
List<CardItemModel> cardItemModel = [

  CardItemModel(
      nameAr: 'الفاتحة',
      nameEn: 'Al-Fatihah',
      versesCount: '7 verses'
  ),

  CardItemModel(
      nameAr: 'الانبياء',
      nameEn: 'Al-Inbiyaa',
      versesCount: '112 verses'
  ),
  
];