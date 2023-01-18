import 'package:flutter/cupertino.dart';
import 'package:jasa_pengiriman/api/transaksi_api.dart';
import 'package:jasa_pengiriman/models/transaksi.dart';

class Transaksis with ChangeNotifier {
  List<Transaksi> _transaksis = [];

  Future<void> getAndSetTransaksis() async {
    _transaksis = await TransaksiApi().getAllTransaksi();
    notifyListeners();
  }

  List<Transaksi> get transaksis{
    List<Transaksi> listTransaksi = _transaksis.where((transaksi) => transaksi.status == 'diproses').toList();
    listTransaksi.addAll(_transaksis.where((transaksi) => transaksi.status == 'diantar'));
    listTransaksi.addAll(_transaksis.where((transaksi) => transaksi.status != 'diproses' && transaksi.status != 'diantar'));
    return listTransaksi;
  }

  Transaksi getTransaksi(String noResi) {
    return _transaksis.firstWhere((transaksi) => transaksi.noResi == noResi);
  }

  Future<void> addTransaksi(Transaksi transaksi) async{
    String noResi = await TransaksiApi().postTransaksi(transaksi);
    transaksi = transaksi.copyWith(noResi: noResi);
    _transaksis.add(transaksi);
    notifyListeners();
  }

  Future<void> updateTransaksi(Transaksi newTransaksi) async{
    await TransaksiApi().updateTransaksi(newTransaksi);
    int index = _transaksis.indexWhere((transaksi) => transaksi.noResi == newTransaksi.noResi);
    _transaksis[index] = newTransaksi;
    notifyListeners();
  }

  Future<void> deleteTransaksi(String noResi) async {
    int index = _transaksis.indexWhere((transaksi) => transaksi.noResi == noResi);
    Transaksi tempTransaksi = _transaksis[index];
    try {
      _transaksis.removeAt(index);
      notifyListeners();
      await TransaksiApi().deleteTransaksi(noResi);
    } catch (e) {
      _transaksis.insert(index, tempTransaksi);
      notifyListeners();
      return Future.error(e);
    }
  }
}