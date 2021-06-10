class TransactionModel {
   int total;
 String date;
   String category;

  TransactionModel(this.total, this.date, this.category);

  TransactionModel.fromMap(Map<String, dynamic> map)
      : assert(map['total'] != null),
        assert(map['date'] != null),
        assert(map['category'] != null);


}
