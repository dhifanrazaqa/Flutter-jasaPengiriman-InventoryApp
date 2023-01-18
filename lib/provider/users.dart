import 'package:flutter/cupertino.dart';
import 'package:jasa_pengiriman/models/customer.dart';
import 'package:jasa_pengiriman/models/penerima.dart';
import 'package:jasa_pengiriman/models/kurir.dart';
import 'package:jasa_pengiriman/api/user_api.dart';

class Users with ChangeNotifier {
  List<Customer> _customers = [];
  List<Penerima> _penerimas = [];
  List<Kurir> _kurirs = [];

  // Customer
  Future<void> getAndSetCustomers() async {
    _customers = await UserApi().getAllCustomer();
    notifyListeners();
  }

  List<Customer> get customers{
    List<Customer> listCustomer = _customers;
    return listCustomer;
  }

  Customer getCustomer(String idCustomer) {
    return _customers.firstWhere((customer) => customer.idCustomer == idCustomer);
  }

  // Penerima
  Future<void> getAndSetPenerima() async {
    _penerimas = await UserApi().getAllPenerima();
    notifyListeners();
  }

  List<Penerima> get penerimas{
    List<Penerima> listPenerima = _penerimas;
    return listPenerima;
  }

  Penerima getPenerima(String idPenerima) {
    return _penerimas.firstWhere((penerima) => penerima.idPenerima == idPenerima);
  }

  // Kurir
  Future<void> getAndSetKurir() async {
    _kurirs = await UserApi().getAllKurir();
    notifyListeners();
  }

  List<Kurir> get kurirs{
    List<Kurir> listKurir = _kurirs;
    return listKurir;
  }

  Kurir getKurir(String idKurir) {
    return _kurirs.firstWhere((kurir) => kurir.idKurir == idKurir);
  }
}