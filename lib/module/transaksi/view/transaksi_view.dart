import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/transaksi_controller.dart';

class TransaksiView extends StatefulWidget {
  const TransaksiView({Key? key}) : super(key: key);

  Widget build(context, TransaksiController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.set0();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: controller.currentSegment == 0
                            ? Colors.green
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          'Proses',
                          style: TextStyle(
                            color: controller.currentSegment == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.set1();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: controller.currentSegment == 1
                            ? Colors.green
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          'Komplet',
                          style: TextStyle(
                            color: controller.currentSegment == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          controller.currentSegment == 0
              ? ListView.builder(
                  itemCount: processTransactions.length,
                  itemBuilder: (context, index) {
                    var transaction = processTransactions[index];
                    return ListTile(
                      title: Text('Tanggal order: ${transaction.date}'),
                      subtitle: Text(
                          'Nomor Invoice: ${transaction.invoiceNumber}\nStatus: ${transaction.status}'),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: processTransactions.length,
                  itemBuilder: (context, index) {
                    var transaction = completeTransactions[index];
                    return ListTile(
                      title: Text('Tanggal order: ${transaction.date}'),
                      subtitle: Text(
                          'Nomor Invoice: ${transaction.invoiceNumber}\nStatus: ${transaction.status}'),
                    );
                  },
                ),
        ],
      ),
    );
  }

  @override
  State<TransaksiView> createState() => TransaksiController();
}

List<Transaction> processTransactions = [
  Transaction(date: '2024-02-13', invoiceNumber: 'INV12345', status: 'Pending'),
  Transaction(
      date: '2024-02-12', invoiceNumber: 'INV12344', status: 'Processing'),
  // Add more transactions as needed
];

List<Transaction> completeTransactions = [
  Transaction(
      date: '2024-02-11', invoiceNumber: 'INV12343', status: 'Completed'),
  Transaction(
      date: '2024-02-10', invoiceNumber: 'INV12342', status: 'Completed'),
  // Add more transactions as needed
];
