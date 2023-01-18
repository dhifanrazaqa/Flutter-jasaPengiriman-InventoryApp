import 'dart:convert';
import 'dart:io';

import '../models/transaksi.dart';
import 'package:http/http.dart' as http;

class TransaksiApi{
  // synchronus
  Future<List<Transaksi>> getAllTransaksi() async {
    final uri = Uri.parse('http://localhost:8080/api/transaksi');
    List<Transaksi> transaksi = [];
    
    // try {
    final response = await http.get(uri);

      // if (response.statusCode == 200) {
    final results = json.decode(response.body) as List<dynamic>;
    // print(results);
    results.forEach((value) {
      transaksi.add(
        Transaksi(
          noResi: value['no_resi'],
          namaBarang: value['nama_barang'],
          beratBarang: value['berat_barang'] is double ? value['berat_barang'] : value['berat_barang'].toDouble(),
          jenisBarang: value['jenis_barang'],
          ongkir: value['ongkir'],
          metodePengiriman: value['metode_pengiriman'],
          status: value['status'],
          tanggalKirim: DateTime.parse(value['tanggal_kirim']),
          tanggalTerima: value['tanggal_terima'] != null ? DateTime.parse(value['tanggal_terima']) : null,
          idCustomer: value['id_customer'],
          idPenerima: value['id_penerima'],
          idKurir: value['id_kurir']
        )
      );
    });
    //   } else {
    //     throw Exception();
    //   }
    // } on SocketException{
    //   throw SocketException('Tidak dapat tersambung ke internet');
    // } catch (e) {
    //   throw Exception(e);
    // }
    return transaksi;
  }

  Future<String> postTransaksi(Transaksi transaksi) async {
    final uri = Uri.parse('http://localhost:8080/api/transaksi');

    Map<String, dynamic> map = {
      'nama_barang': transaksi.namaBarang,
      'berat_barang': transaksi.beratBarang,
      'jenis_barang': transaksi.jenisBarang,
      'ongkir': transaksi.ongkir,
      'metode_pengiriman': transaksi.metodePengiriman,
      'status': transaksi.status,
      'id_customer': transaksi.idCustomer,
      'id_penerima': transaksi.idPenerima,
      'id_kurir': transaksi.idKurir,
    };

    final body = json.encode(map);
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body
    );
    return json.decode(response.body)["no_resi"];
  }

  Future<void> updateTransaksi(Transaksi transaksi) async {
    final uri = Uri.parse('http://localhost:8080/api/transaksi/${transaksi.noResi}');

    Map<String, dynamic> map = {
      'nama_barang': transaksi.namaBarang,
      'berat_barang': transaksi.beratBarang,
      'jenis_barang': transaksi.jenisBarang,
      'ongkir': transaksi.ongkir,
      'metode_pengiriman': transaksi.metodePengiriman,
      'status': transaksi.status,
      'id_customer': transaksi.idCustomer,
      'id_penerima': transaksi.idPenerima,
      'id_kurir': transaksi.idKurir,
    };

    final body = json.encode(map);
    final response = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body
    );
    print(response);
  }

  Future<void> deleteTransaksi(String noResi) async {
    final uri = Uri.parse('http://localhost:8080/api/transaksi/${noResi}');
    final response = await http.delete(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response);
  }
}