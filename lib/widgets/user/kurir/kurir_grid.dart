import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/models/kurir.dart';
import 'package:jasa_pengiriman/provider/users.dart';
import 'package:jasa_pengiriman/widgets/user/kurir/kurir_item.dart';
import 'package:provider/provider.dart';

class KurirGrid extends StatefulWidget {
  const KurirGrid({super.key});

  @override
  State<KurirGrid> createState() => _KurirGridState();
}

class _KurirGridState extends State<KurirGrid> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Users>(context);
    List<Kurir> listKurir = userProvider.kurirs;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listKurir.length,
        itemBuilder: (context, index) => KurirItem(
          id: listKurir[index].idKurir,
          ctx: context,
        ),
      ),
    );
  }
}