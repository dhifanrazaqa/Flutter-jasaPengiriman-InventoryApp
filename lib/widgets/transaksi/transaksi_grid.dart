import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/widgets/transaksi/transaksi_item.dart';
import 'package:provider/provider.dart';
import 'package:jasa_pengiriman/provider/transaksis.dart';
import 'package:jasa_pengiriman/models/transaksi.dart';

class TransaksiGrid extends StatefulWidget {
  const TransaksiGrid({super.key});

  @override
  State<TransaksiGrid> createState() => _TransaksiGridState();
}

class _TransaksiGridState extends State<TransaksiGrid> {
  @override
  Widget build(BuildContext context) {
    final transaksiProvider = Provider.of<Transaksis>(context);
    List<Transaksi> listTransaksi = transaksiProvider.transaksis;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listTransaksi.length,
        itemBuilder: (context, index) => TransaksiItem(
          id: listTransaksi[index].noResi,
          ctx: context,
        ),
      ),
    );
  }
}