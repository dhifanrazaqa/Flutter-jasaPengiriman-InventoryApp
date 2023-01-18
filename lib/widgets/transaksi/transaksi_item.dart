import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jasa_pengiriman/provider/transaksis.dart';
import 'package:jasa_pengiriman/models/transaksi.dart';
import 'package:jasa_pengiriman/screens/add_or_detail_screen.dart';

class TransaksiItem extends StatefulWidget {
  final String? id;
  final BuildContext? ctx;
  TransaksiItem({
    this.id,
    this.ctx,
  });

  @override
  State<TransaksiItem> createState() => _TransaksiItemState();
}

class _TransaksiItemState extends State<TransaksiItem> {
  @override
  Widget build(BuildContext context) {
    final transaksiProvider = Provider.of<Transaksis>(context, listen: false);
    Transaksi transaksi = transaksiProvider.getTransaksi(widget.id.toString());
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          AddOrDetailScreen.routeName,
          arguments: transaksi.noResi
        ),
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
                  color: transaksi.status == 'diproses' 
                  ? Colors.red 
                  : transaksi.status == 'diantar'
                  ? Colors.amber
                  : Colors.green,
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
                      const Text("Transaksi", style: TextStyle(color: Colors.grey),),
                      const SizedBox(height: 5,),
                      Text(transaksi.namaBarang!, style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueGrey[800]),),
                      const SizedBox(height: 5,),
                      Text(transaksi.jenisBarang!, style: TextStyle(color: Colors.grey[850]),),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if(transaksi.status == 'sampai')
                            const Icon(Icons.circle, size: 10, color: Colors.green),
                          if(transaksi.status == 'diantar')
                            const Icon(Icons.circle, size: 10, color: Colors.amber),
                          if(transaksi.status == 'diproses')
                            const Icon(Icons.circle, size: 10, color: Colors.red),
                          const SizedBox(width: 10),
                          Text(
                            transaksi.status!,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        transaksi.noResi!,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

// Container(
              //   alignment: Alignment.center,
              //   height: size.height * 0.08,
              //   width: size.width * 0.85,
              //   child: Row(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10,right: 30),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Text("Transaksi", style: TextStyle(color: Colors.grey),),
              //             Padding(
              //               padding: const EdgeInsets.only(top: 10, bottom: 10),
              //               child: Text(transaksi.namaBarang!, style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueGrey[800]),),
              //             ),
              //             Text(transaksi.jenisBarang!, style: TextStyle(color: Colors.grey[850]),),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.end,
              //           children: [
              //             Text(transaksi.namaBarang!),
              //             Text(transaksi.metodePengiriman!),
              //             Text(transaksi.noResi!),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),