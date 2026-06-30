import 'package:flutter/material.dart';
import 'package:islamic/features/quraan/sora_detailed.dart';
import 'sura_list.dart';
import 'cards.dart';
import 'models/list_item_model.dart';

class QuraanPage extends StatefulWidget {
  QuraanPage({super.key});

  @override
  State<QuraanPage> createState() => _QuraanPageState();
}

class _QuraanPageState extends State<QuraanPage> {
final TextEditingController myController = TextEditingController();
List<SuraModels> recentSuras = [];
List<SuraModels> filteredSuras = [];
@override
void initState() {
  super.initState();
  // recentSuras = suras;
  filteredSuras = suras;
}
void SearchSora(String query) {
  setState(() {
    if(query.isEmpty){
      filteredSuras = suras;
    }
    else{
      filteredSuras = suras.where((sura){
        return sura.nameEn.toLowerCase().contains(query.toLowerCase()) ||
         sura.nameAr.toLowerCase().contains(query.toLowerCase());}).toList();
      }
  });
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          SizedBox(
            height: 55,
            child: TextField(
              controller: myController,
              onChanged: SearchSora,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFE2BE7F)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFE2BE7F)),
                ),
                prefixIcon: Image.asset(
                  'assets/icons/ic_quraan.png',
                  height: 20,
                  width: 20,
                ),
                suffixIcon: IconButton( 
                  icon: Icon(
                    Icons.backspace_outlined,
                    color: Colors.white,
                    size: 15,
                  ),
                  onPressed: () => myController.clear(), // SearchSora(myController.text),
                  
                  
                  )
              
                ,
                  
          
                hintText: 'Sura Name',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          if (recentSuras.isNotEmpty && filteredSuras.length ==suras.length ) ...[
            Row(
              children: [
                Text(
                  'Most Recently',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: recentSuras.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final currentSura = recentSuras[index];
                  return RecentSuraCard(
                    suraNameAr: currentSura.nameAr,
                    suraNameEn: currentSura.nameEn,
                    versesCount: '${currentSura.verses} ',
                    index: index,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SoraDetailed(index: currentSura.index),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Suras List',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: filteredSuras.length,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                final sura = filteredSuras[index];
                return SuraListItem(
                  index: sura.index,
                  suraNameEn: sura.nameEn,
                  suraNameAr: sura.nameAr,
                  versesCount: '${sura.verses} verses',
                  onTap: () {
                    setState(() {
                      recentSuras.removeWhere(
                       ((element) => element.nameEn == sura.nameEn),
                      );
                      recentSuras.insert(0, sura);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SoraDetailed(index: sura.index),
                        ),
                      );
                    });
                  },
                  // onTap: () {
                  //   setState(() {
                  //     recentSuras = sura;
                  //   });
                  // },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
