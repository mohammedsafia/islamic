import 'package:flutter/material.dart';

class SuraListItem extends StatelessWidget {
  final String suraNameAr;
  final String suraNameEn;
  final String versesCount;
  final int index;
  // final Function(SuraModels) onSuraTap;
final VoidCallback onTap ;
  const SuraListItem({
    super.key,
    required this.suraNameAr,
    required this.suraNameEn,
    required this.versesCount,
    required this.index,
    required this.onTap,
    // required this.onSuraTap,
 });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,

      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/icons/icon.png', height: 52, width: 52),
            Text(
              '${index + 1}',
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        title: Text(
          suraNameEn,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        subtitle: Text(
          versesCount,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        trailing: Text(
          suraNameAr,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
