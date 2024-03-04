import 'package:flutter/material.dart';
import 'package:login/editPage.dart';
import './model.dart';
import 'manageDB.dart';

class output extends StatefulWidget {
  @override
  State<output> createState() => _OutputState();
}

class _OutputState extends State<output> {
  manageDB db = manageDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('My order', style: TextStyle(fontFamily: 'Noto Sans Thai')),
            Text('2', style: TextStyle(fontFamily: 'Noto Sans Thai')),
            Text('3', style: TextStyle(fontFamily: 'Noto Sans Thai'))
          ],
        ),
      ),
      body: FutureBuilder<List<userDB>>(
        future: db.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                userDB user = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    showDetail(user);
                  },
                  child: ListTile(
                    title: Text(
                      '${user.NameAndSurname}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                              'ประเภทตู้สินค้า\t: ${user.selectedContainerType}',
                              style: TextStyle(fontFamily: 'Noto Sans Thai')),
                          Text('น้ำหนักสินค้า\t: ${user.weight}',
                              style: TextStyle(fontFamily: 'Noto Sans Thai')),
                          Text('ประเทศปลายทาง\t: ${user.selectedDestination}',
                              style: TextStyle(fontFamily: 'Noto Sans Thai')),
                          Text('ระยะทาง\t: ${user.distance}',
                              style: TextStyle(fontFamily: 'Noto Sans Thai')),
                          Text('ยอดรวม\t: ${user.totalPrice}',
                              style: TextStyle(fontFamily: 'Noto Sans Thai')),
                        ],
                      ),
                    ),
                    trailing: Container(
                      width: 70,
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => editPage(),
                                    settings: RouteSettings(arguments: user),
                                  ),
                                ).then((_) {
                                  setState(() {
                                    db.getAllData();
                                  });
                                });
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                deleteDialog(user);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          } else {
            return Center(
                child: Text('No data',
                    style: TextStyle(fontFamily: 'Noto Sans Thai')));
          }
        },
      ),
    );
  }

  void deleteDialog(userDB user) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Are you sure to delete?',
              style: TextStyle(fontFamily: 'Noto Sans Thai')),
          actions: [
            TextButton(
              onPressed: () {
                db.deleteData(user);
                setState(() {});
                Navigator.pop(context);
              },
              child: Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('Delete',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Noto Sans Thai')),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.green, fontFamily: 'Noto Sans Thai'),
              ),
            ),
          ],
        );
      },
    );
  }

  void showDetail(userDB user) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(249, 239, 219, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Container(
            height: 200,
            child: Column(
              children: [
                Center(
                  child: Text(
                    '${user.Email}',
                    style:
                        TextStyle(fontSize: 25, fontFamily: 'Noto Sans Thai'),
                  ),
                ),
                Text(
                  '${user.NameAndSurname}',
                  style: TextStyle(fontSize: 15, fontFamily: 'Noto Sans Thai'),
                ),
                Text('${user.id}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
