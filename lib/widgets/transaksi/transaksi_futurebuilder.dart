import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/screens/add_or_detail_screen.dart';
import 'package:jasa_pengiriman/widgets/transaksi/transaksi_grid.dart';
import 'package:provider/provider.dart';

import '../../provider/transaksis.dart';

class TransaksiFutureBuilder extends StatefulWidget {
  const TransaksiFutureBuilder({super.key});

  @override
  State<TransaksiFutureBuilder> createState() => _TransaksiFutureBuilderState();
}

class _TransaksiFutureBuilderState extends State<TransaksiFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<Transaksis>(context, listen: false).getAndSetTransaksis(),
        builder: (context, transaksiSnapshot) {
          if(transaksiSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if(transaksiSnapshot.hasError) {
            return Center(child: Text(transaksiSnapshot.error.toString()),);
          }
    
          return const TransaksiGrid();
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
          
      //   },
      //   child: const Icon(Icons.add),
      // )
    );
  }
}