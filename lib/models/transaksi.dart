class Transaksi {
  String? noResi;
  String? namaBarang;
  double? beratBarang;
  String? jenisBarang;
  int? ongkir;
  String? metodePengiriman;
  String? status;
  DateTime? tanggalKirim;
  DateTime? tanggalTerima;
  String? idCustomer;
  String? idPenerima;
  String? idKurir;

  Transaksi({
    this.noResi,
    this.namaBarang,
    this.beratBarang,
    this.jenisBarang,
    this.ongkir,
    this.metodePengiriman,
    this.status,
    this.tanggalKirim,
    this.tanggalTerima,
    this.idCustomer,
    this.idPenerima,
    this.idKurir
  });

  Transaksi copyWith({
    String? noResi,
    String? namaBarang,
    double? beratBarang,
    String? jenisBarang,
    int? ongkir,
    String? metodePengiriman,
    String? status,
    DateTime? tanggalKirim,
    DateTime? tanggalTerima,
    String? idCustomer,
    String? idPenerima,
    String? idKurir,
  }) {
    return Transaksi(
      noResi: noResi == null ? this.noResi : noResi,
      namaBarang: namaBarang == null ? this.namaBarang : namaBarang,
      beratBarang: beratBarang == null ? this.beratBarang : beratBarang,
      jenisBarang: jenisBarang == null ? this.jenisBarang : jenisBarang,
      ongkir: ongkir == null ? this.ongkir : ongkir,
      metodePengiriman: metodePengiriman == null ? this.metodePengiriman : metodePengiriman,
      status: status == null ? this.status : status,
      tanggalKirim: tanggalKirim == null ? this.tanggalKirim : tanggalKirim,
      tanggalTerima: tanggalTerima == null ? this.tanggalTerima : tanggalTerima,
      idCustomer: idCustomer == null ? this.idCustomer : idCustomer,
      idPenerima: idPenerima == null ? this.idPenerima : idPenerima,
      idKurir: idKurir == null ? this.idKurir : idKurir,
    );
  }
}