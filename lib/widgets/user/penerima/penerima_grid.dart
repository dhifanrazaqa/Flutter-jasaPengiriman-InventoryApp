import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/models/penerima.dart';
import 'package:jasa_pengiriman/provider/users.dart';
import 'package:jasa_pengiriman/widgets/user/penerima/penerima_item.dart';
import 'package:provider/provider.dart';

class PenerimaGrid extends StatefulWidget {
  const PenerimaGrid({super.key});

  @override
  State<PenerimaGrid> createState() => _PenerimaGridState();
}

class _PenerimaGridState extends State<PenerimaGrid> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Users>(context);
    List<Penerima> listPenerima = userProvider.penerimas;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listPenerima.length,
        itemBuilder: (context, index) => PenerimaItem(
          id: listPenerima[index].idPenerima,
          ctx: context,
        ),
      ),
    );
  }
}