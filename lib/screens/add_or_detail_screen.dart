import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/models/transaksi.dart';
import 'package:jasa_pengiriman/provider/transaksis.dart';
import 'package:provider/provider.dart';

const List<String> listJenisBarang = <String>['Elektronik', 'Fashion', 'Furnitur', 'Pecah belah', 'Lain-lain'];

const List<String> listMetodePengiriman = <String>['reguler', 'kargo', 'express'];

const List<String> listStatus = <String>['diproses', 'diantar', 'sampai'];

class AddOrDetailScreen extends StatefulWidget {
  const AddOrDetailScreen({super.key});
  static const routeName = '/addOrDetailScreen';

  @override
  State<AddOrDetailScreen> createState() => _AddOrDetailScreenState();
}

class _AddOrDetailScreenState extends State<AddOrDetailScreen> {
  Transaksi _transaksi = Transaksi(
    noResi: null,
    namaBarang: '',
    beratBarang: 0.0,
    jenisBarang: '',
    ongkir: 0,
    metodePengiriman: '',
    status: '',
    tanggalKirim: null,
    tanggalTerima: null,
    idCustomer: '',
    idPenerima: '',
    idKurir: '',
  );

  bool _init = true;
  bool edit = false;

  String jenisBarangValue = listJenisBarang.first;
  String metodePengirimanValue = listMetodePengiriman.first;
  String statusValue = listStatus.first;
  
  final _formKey = GlobalKey<FormState>();

  void submitNote() async{
    _formKey.currentState?.save();
    _transaksi = _transaksi.copyWith(status: statusValue, jenisBarang: jenisBarangValue, metodePengiriman: metodePengirimanValue);
    final transaksiProvider = Provider.of<Transaksis>(context, listen: false);
    if(_transaksi.noResi == null) {
      await transaksiProvider.addTransaksi(_transaksi);
    } else {
      await transaksiProvider.updateTransaksi(_transaksi);
    }
    
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    if(_init) {
      String noResi = ModalRoute.of(context)!.settings.arguments as String;
      if (noResi != '') {
        _transaksi = Provider.of<Transaksis>(context).getTransaksi(noResi);
        jenisBarangValue = _transaksi.jenisBarang!;
        metodePengirimanValue = _transaksi.metodePengiriman!;
        statusValue = _transaksi.status!;
        edit = true;
      } else {
        jenisBarangValue = listJenisBarang.first;
        metodePengirimanValue = listMetodePengiriman.first;
        statusValue = listStatus.first;
        edit = false;
      }
      
      _init = false;
    }
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    final TransaksiProvider = Provider.of<Transaksis>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Jasa Pengiriman'),
        backgroundColor: const Color(0xff4B56D2),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: submitNote,
            child: const Text("Simpan", style: TextStyle(color: Colors.white),)
          ),
        ]
      ),
      backgroundColor: const Color(0xff4B56D2),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.06,
              child: Container(
                height: size.height * 0.09 - 27,
                decoration: const BoxDecoration(
                  color: Color(0xff4B56D2),
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(23),
                  //   bottomRight: Radius.circular(23)
                  // ),
                ),
              ) 
            ),
            Container(
              padding: const EdgeInsets.all(35),
              // height: size.height * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Nama Barang: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    TextFormField(
                      initialValue: _transaksi.namaBarang,
                      decoration: InputDecoration(
                        hintText: 'Laptop',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        fillColor: Colors.grey[100],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 0, 
                                style: BorderStyle.none,
                            ),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      onSaved: (value) {
                        _transaksi = _transaksi.copyWith(namaBarang: value);
                      },
                    ),
                    const SizedBox(height: 10,),
                    const Text("Berat Barang (Kg):", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    TextFormField(
                      initialValue: _transaksi.beratBarang.toString(),
                      decoration: InputDecoration(
                      hintText: '0.0',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.grey[100],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              width: 0, 
                              style: BorderStyle.none,
                          ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      ),
                      onSaved: (value) {
                        _transaksi = _transaksi.copyWith(beratBarang: double.parse(value!));
                      },
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Jenis Barang:", style: TextStyle(fontWeight: FontWeight.bold),),
                    DropdownButton<String>(
                      value: jenisBarangValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        _transaksi = _transaksi.copyWith(jenisBarang: jenisBarangValue);
                        setState(() {
                          jenisBarangValue = value!;
                        });
                      },
                      items: listJenisBarang.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Ongkir (Rp):", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    TextFormField(
                      initialValue: _transaksi.ongkir.toString(),
                      decoration: InputDecoration(
                      hintText: '0',
                      fillColor: Colors.grey[100],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              width: 0, 
                              style: BorderStyle.none,
                          ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      ),
                      onSaved: (value) {
                        _transaksi = _transaksi.copyWith(ongkir: int.parse(value!));
                      },
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10,),
                    const Text("Metode Pengiriman:", style: TextStyle(fontWeight: FontWeight.bold),),
                    DropdownButton<String>(
                      value: metodePengirimanValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        _transaksi = _transaksi.copyWith(metodePengiriman: metodePengirimanValue);
                        setState(() {
                          metodePengirimanValue = value!;
                        });
                      },
                      items: listMetodePengiriman.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Status:", style: TextStyle(fontWeight: FontWeight.bold),),
                    DropdownButton<String>(
                      value: statusValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        _transaksi = _transaksi.copyWith(status: statusValue);
                        setState(() {
                          statusValue = value!;
                        });
                      },
                      items: listStatus.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10,),
                    const Text("ID Customer:", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    TextFormField(
                      initialValue: _transaksi.idCustomer,
                      decoration: InputDecoration(
                      hintText: 'CR000',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.grey[100],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              width: 0, 
                              style: BorderStyle.none,
                          ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      ),
                      onSaved: (value) {
                        _transaksi = _transaksi.copyWith(idCustomer: value);
                      },
                    ),
                    const SizedBox(height: 10,),
                    const Text("ID Penerima: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    TextFormField(
                      initialValue: _transaksi.idPenerima,
                      decoration: InputDecoration(
                      hintText: 'PR000',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.grey[100],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              width: 0, 
                              style: BorderStyle.none,
                          ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      ),
                      onSaved: (value) {
                        _transaksi = _transaksi.copyWith(idPenerima: value);
                      },
                    ),
                    const SizedBox(height: 10,),
                    const Text("ID Kurir:", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    TextFormField(
                      initialValue: _transaksi.idKurir,
                      decoration: InputDecoration(
                      hintText: 'KR000',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.grey[100],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              width: 0, 
                              style: BorderStyle.none,
                          ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      ),
                      onSaved: (value) {
                        _transaksi = _transaksi.copyWith(idKurir: value);
                      },
                    ),
                    const SizedBox(height: 20,),
                    if(edit) 
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4B56D2),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          TransaksiProvider.deleteTransaksi(_transaksi.noResi!);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Hapus")
                      )
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}