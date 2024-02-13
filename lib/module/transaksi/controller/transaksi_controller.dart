import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/transaksi_view.dart';

class TransaksiController extends State<TransaksiView> {
  static late TransaksiController instance;
  late TransaksiView view;
  int currentSegment = 0;
  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  void set0() {
    setState(() {
      currentSegment = 0;
    });
  }

  void set1() {
    setState(() {
      currentSegment = 1;
    });
  }
}

class Transaction {
  String date;
  String invoiceNumber;
  String status;

  Transaction(
      {required this.date, required this.invoiceNumber, required this.status});
}

// List<Transaction> processTransactions = [
//   Transaction(date: '2024-02-13', invoiceNumber: 'INV12345', status: 'Pending'),
//   Transaction(
//       date: '2024-02-12', invoiceNumber: 'INV12344', status: 'Processing'),
//   // Add more transactions as needed
// ];

// List<Transaction> completeTransactions = [
//   Transaction(
//       date: '2024-02-11', invoiceNumber: 'INV12343', status: 'Completed'),
//   Transaction(
//       date: '2024-02-10', invoiceNumber: 'INV12342', status: 'Completed'),
//   // Add more transactions as needed
// ];
// Widget buildProcessSegment() {
//   // Placeholder for the content of the "Proses" segment
//   return ListView.builder(
//     itemCount: processTransactions.length,
//     itemBuilder: (context, index) {
//       var transaction = processTransactions[index];
//       return ListTile(
//         title: Text('Tanggal order: ${transaction.date}'),
//         subtitle: Text(
//             'Nomor Invoice: ${transaction.invoiceNumber}\nStatus: ${transaction.status}'),
//       );
//     },
//   );
// }

// Widget buildCompleteSegment() {
//   // Placeholder for the content of the "Komplet" segment
//   return ListView.builder(
//     itemCount: completeTransactions.length,
//     itemBuilder: (context, index) {
//       var transaction = completeTransactions[index];
//       return ListTile(
//         title: Text('Tanggal order: ${transaction.date}'),
//         subtitle: Text(
//             'Nomor Invoice: ${transaction.invoiceNumber}\nStatus: ${transaction.status}'),
//       );
//     },
//   );
// }
