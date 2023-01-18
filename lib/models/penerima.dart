class Penerima {
  String? idPenerima;
  String? namaPenerima;
  String? alamat;
  String? noHp;
  String? kodeArea;

  Penerima({
    this.idPenerima,
    this.namaPenerima,
    this.alamat,
    this.noHp,
    this.kodeArea
  });

  Penerima copyWith({
    String? idPenerima,
    String? namaPenerima,
    String? alamat,
    String? noHp,
    String? kodeArea,
  }) {
    return Penerima(
      idPenerima: idPenerima == null ? this.idPenerima : idPenerima,
      namaPenerima: namaPenerima == null ? this.namaPenerima : namaPenerima,
      alamat: alamat == null ? this.alamat : alamat,
      noHp: noHp == null ? this.noHp : noHp,
      kodeArea: kodeArea == null ? this.kodeArea : kodeArea,
    );
  }
}