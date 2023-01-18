import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jasa_pengiriman/models/customer.dart';
import 'package:jasa_pengiriman/models/penerima.dart';
import 'package:jasa_pengiriman/models/kurir.dart';

class UserApi{
  Future<List<Customer>> getAllCustomer() async{
    final uri = Uri.parse('http://localhost:8080/api/user/customer');
    List<Customer> customer = [];

    final response = await http.get(uri);

    final results = json.decode(response.body);
    final data = results["data"] as List<dynamic>;

    for (var value in data) {
      customer.add(
        Customer(
          idCustomer: value["id_customer"],
          namaCustomer: value["nama_customer"],
          alamat: value["alamat"],
          noHp: value["no_hp"],
          kodeArea: value["kode_area"].toString()
        )
      );
    }
    return customer;
  }

  Future<List<Penerima>> getAllPenerima() async{
    final uri = Uri.parse('http://localhost:8080/api/user/penerima');
    List<Penerima> penerima = [];

    final response = await http.get(uri);

    final results = json.decode(response.body);
    final data = results["data"] as List<dynamic>;

    for (var value in data) {
      penerima.add(
        Penerima(
          idPenerima: value["id_penerima"],
          namaPenerima: value["nama_penerima"],
          alamat: value["alamat"],
          noHp: value["no_hp"],
          kodeArea: value["kode_area"].toString()
        )
      );
    }
    return penerima;
  }

  Future<List<Kurir>> getAllKurir() async{
    final uri = Uri.parse('http://localhost:8080/api/user/kurir');
    List<Kurir> kurir = [];

    final response = await http.get(uri);

    final results = json.decode(response.body);
    final data = results["data"] as List<dynamic>;

    for (var value in data) {
      kurir.add(
        Kurir(
          idKurir: value["id_kurir"],
          namaKurir: value["nama_kurir"],
          noHp: value["no_hp"],
        )
      );
    }
    return kurir;
  }
}