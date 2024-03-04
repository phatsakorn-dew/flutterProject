class userDB {
  final int? id;
  String NameAndSurname;
  String PhoneNumber;
  String Email;
  String selectedContainerType;
  int weight;
  String selectedDestination;
  int distance;
  int basePriceByWeight;
  int priceByDistance;
  int totalPrice;

  userDB(
      {this.id,
      required this.NameAndSurname,
      required this.PhoneNumber,
      required this.Email,
      required this.selectedContainerType,
      required this.weight,
      required this.selectedDestination,
      required this.distance,
      required this.basePriceByWeight,
      required this.priceByDistance,
      required this.totalPrice});

  userDB.fromMap(Map<String, dynamic> item)
      : id = item['id'],
        NameAndSurname = item['NameAndSurname'],
        PhoneNumber = item['PhoneNumber'],
        Email = item['Email'],
        selectedContainerType = item['selectedContainerType'],
        weight = item['weight'],
        selectedDestination = item['selectedDestination'],
        distance = item['distance'],
        basePriceByWeight = item['basePriceByWeight'],
        priceByDistance = item['priceByDistance'],
        totalPrice = item['totalPrice'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'NameAndSurname': NameAndSurname,
      'PhoneNumber': PhoneNumber,
      'Email': Email,
      'selectedContainerType': selectedContainerType,
      'weight': weight,
      'selectedDestination': selectedDestination,
      'distance': distance,
      'basePriceByWeight': basePriceByWeight,
      'priceByDistance': priceByDistance,
      'totalPrice': totalPrice,
    };
  }
}
