import 'package:flutter/material.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/utils/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'search doctor or hospital',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print('Filter clicked');
                  },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {
                    print('Search clicked');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  textAlign: TextAlign.right,
                  'Recent Searches',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    print('Clear clicked');
                  },
                  child: Text('Clear', style: TextStyle(color: AppColors.whiteColor)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text('Cardiology'),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          print('Remove Cardiology');
                        },
                        child: Icon(Icons.close, size: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text('Elnour mokatam '),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          print('Remove Cardiology');
                        },
                        child: Icon(Icons.close, size: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text('Elhabib hospital'),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          print('Remove Cardiology');
                        },
                        child: Icon(Icons.close, size: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
