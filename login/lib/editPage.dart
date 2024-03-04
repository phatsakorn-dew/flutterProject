import 'package:flutter/material.dart';
import 'manageDB.dart';
import 'model.dart';

class editPage extends StatefulWidget {
  @override
  State<editPage> createState() => _EditPageState();
}

class _EditPageState extends State<editPage> {
  manageDB db = manageDB();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as userDB;
    final titleControllerName =
        TextEditingController(text: data.NameAndSurname);
    final titleControllerEmail = TextEditingController(text: data.Email);
    final titleControllerType =
        TextEditingController(text: data.selectedContainerType);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 136, 137, 1),
        title: Center(
          child: Text(
            'Example',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Noto Sans Thai'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Edit Name and Surname',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Noto Sans Thai'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: titleControllerName,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Add a Name and Surname',
                    icon: Icon(Icons.title),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter Name and Surname';
                    return null;
                  },
                ),
                TextFormField(
                  controller: titleControllerEmail,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Add a Email',
                    icon: Icon(Icons.title),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter Email';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Map input = {
                      'id': data.id,
                      'NameAndSurname': titleControllerName.text,
                      'Email': titleControllerEmail.text,
                    };
                    if (formKey.currentState!.validate()) {
                      update(input);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> update(Map input) async {
    userDB data = userDB(
        id: input['id'],
        NameAndSurname: input['NameAndSurname'],
        PhoneNumber: input['PhoneNumber'],
        Email: input['Email'],
        selectedContainerType: input['selectedContainerType'],
        distance: input['distance'],
        weight: input['weight'],
        selectedDestination: input['selectedDestination'],
        basePriceByWeight: input['basePriceByWeight'],
        priceByDistance: input['priceByDistance'],
        totalPrice: input['totalPrice']);
    await db.updateData(data);
  }
}
