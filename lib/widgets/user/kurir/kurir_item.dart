import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/models/kurir.dart';
import 'package:jasa_pengiriman/provider/users.dart';
import 'package:provider/provider.dart';
import 'package:jasa_pengiriman/provider/transaksis.dart';
import 'package:jasa_pengiriman/models/transaksi.dart';
import 'package:jasa_pengiriman/screens/add_or_detail_screen.dart';

class KurirItem extends StatefulWidget {
  final String? id;
  final BuildContext? ctx;
  KurirItem({
    this.id,
    this.ctx,
  });

  @override
  State<KurirItem> createState() => _KurirItemState();
}

class _KurirItemState extends State<KurirItem> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Users>(context, listen: false);
    Kurir kurir = userProvider.getKurir(widget.id.toString());
    Size size = MediaQuery.of(context).size;
    
    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        // onTap: () => Navigator.of(context).pushNamed(
        //   AddOrDetailScreen.routeName,
        //   arguments: transaksi.noResi
        // ),
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.08,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // alignment: Alignment.centerLeft,
                height: size.height * 0.08,
                width: size.width * 0.015,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xff153462),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(kurir.namaKurir!, style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueGrey[800]),),
                      const SizedBox(height: 5,),
                      Text(kurir.noHp!, style: TextStyle(color: Colors.grey),),                    
                    ],
                  ),
                ),
              ),
              // Flexible(
              //   fit: FlexFit.tight,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             if(transaksi.status == 'sampai')
              //               const Icon(Icons.circle, size: 10, color: Colors.green),
              //             if(transaksi.status == 'diantar')
              //               const Icon(Icons.circle, size: 10, color: Colors.amber),
              //             if(transaksi.status == 'diproses')
              //               const Icon(Icons.circle, size: 10, color: Colors.red),
              //             const SizedBox(width: 10),
              //             Text(
              //               transaksi.status!,
              //               maxLines: 1,
              //               softWrap: false,
              //               overflow: TextOverflow.fade,
              //             ),
              //           ],
              //         ),
              //         const SizedBox(height: 10),
              //         Text(
              //           transaksi.noResi!,
              //           maxLines: 1,
              //           softWrap: false,
              //           overflow: TextOverflow.fade,
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        )
      ),
    );
  }
}