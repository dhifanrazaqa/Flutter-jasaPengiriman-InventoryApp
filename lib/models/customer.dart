class Customer {
  String? idCustomer;
  String? namaCustomer;
  String? alamat;
  String? noHp;
  String? kodeArea;

  Customer({
    this.idCustomer,
    this.namaCustomer,
    this.alamat,
    this.noHp,
    this.kodeArea
  });

  Customer copyWith({
    String? idCustomer,
    String? namaCustomer,
    String? alamat,
    String? noHp,
    String? kodeArea,
  }) {
    return Customer(
      idCustomer: idCustomer == null ? this.idCustomer : idCustomer,
      namaCustomer: namaCustomer == null ? this.namaCustomer : namaCustomer,
      alamat: alamat == null ? this.alamat : alamat,
      noHp: noHp == null ? this.noHp : noHp,
      kodeArea: kodeArea == null ? this.kodeArea : kodeArea,
    );
  }
}