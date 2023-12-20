import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/domain/repositories/tranfers_extension.dart';
import 'package:split_bill/features/outcome/domain/repositories/whatsapp_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class ExportRepository {
  static exportString(Bill? bill) async {
    if (bill == null) return;
    final uri = WhatsAppRepository(
      text: _createMessageToSend(bill),
    ).asUri();

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  static String _createMessageToSend(Bill bill) {
    // geet summery by user
    final summary = bill.divideByUser();

    // get list of people that gets payment
    final people = summary.returnPeopleGettingMoney();

    // get list of tranffers
    final tranfers = summary.returnTranferList();

    // create message
    String message = 'Hello, \n\n';
    message += 'Here is the summary of the bill ${bill.title}:\n\n';

    message += 'Payment data:\n';
    for (String user in people) {
      message += '$user: <Payment account>';
    }
    message += '-----------\n';
    message += 'Expenses:\n';
    for (String user in summary.keys) {
      message +=
          '$user: ${summary[user]!['spend']! - summary[user]!["cost"]!}\n';
    }
    message += '-----------\n';
    message += 'Tranfers:\n';
    for (Map<String, dynamic> tranfer in tranfers) {
      message +=
          '${tranfer['from']} -> ${tranfer['to']}: ${tranfer['amount']}\n';
    }
    message += '-----------\n';
    return message;
  }
}
