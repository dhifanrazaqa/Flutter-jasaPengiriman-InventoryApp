import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/models/penerima.dart';
import 'package:jasa_pengiriman/provider/users.dart';
import 'package:provider/provider.dart';

class PenerimaItem extends StatefulWidget {
  final String? id;
  final BuildContext? ctx;
  PenerimaItem({
    this.id,
    this.ctx,
  });

  @override
  State<PenerimaItem> createState() => _PenerimaItemState();
}

class _PenerimaItemState extends State<PenerimaItem> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Users>(context, listen: false);
    Penerima penerima = userProvider.getPenerima(widget.id.toString());
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
                  color: const Color(0xff8D9EFF),
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
                      Text(penerima.namaPenerima!, style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueGrey[800]),),
                      const SizedBox(height: 5,),
                      Text(penerima.noHp!, style: TextStyle(color: Colors.grey),),                    
                      const SizedBox(height: 5,),
                      Text(penerima.alamat!, style: TextStyle(color: Colors.grey[850]),),
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