typedef MapDivideByUser = Map<String, Map<String, double>>;

extension TRanferExtension on MapDivideByUser {
  List<Map<String, dynamic>> returnTranferList() {
    // Calculate net debt for each user
    Map<String, double> netDebts = {};

    forEach((userName, values) {
      double spend = values['spend'] ?? 0.0;
      double cost = values['cost'] ?? 0.0;

      double debtAmount = spend - cost;
      netDebts[userName] = debtAmount;
    });

    // Calculate minimum transfer needed
    List<Map<String, dynamic>> transfers = [];

    List<MapEntry<String, double>> sortedDebts = netDebts.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    while (sortedDebts.length > 1) {
      final debtor = sortedDebts.first;
      final creditor = sortedDebts.last;

      final transferAmount = debtor.value.abs() < creditor.value.abs()
          ? debtor.value.abs()
          : creditor.value.abs();

      transfers.add({
        'from': debtor.key,
        'to': creditor.key,
        'amount': transferAmount,
      });

      netDebts[debtor.key] = netDebts[debtor.key]! + transferAmount;
      netDebts[creditor.key] = netDebts[creditor.key]! - transferAmount;

      if (netDebts[debtor.key] == 0.0) sortedDebts.remove(debtor);
      if (netDebts[creditor.key] == 0.0) sortedDebts.remove(creditor);
    }
    return transfers;
  }

  List<String> returnPeopleGettingMoney() {
    List<String> people = [];
    forEach((userName, values) {
      double spend = values['spend'] ?? 0.0;
      double cost = values['cost'] ?? 0.0;

      if (spend > cost) people.add(userName);
    });
    return people;
  }
}
