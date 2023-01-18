class Kurir {
  String? idKurir;
  String? namaKurir;
  String? noHp;

  Kurir({
    this.idKurir,
    this.namaKurir,
    this.noHp,
  });

  Kurir copyWith({
    String? idKurir,
    String? namaKurir,
    String? noHp,
  }) {
    return Kurir(
      idKurir: idKurir == null ? this.idKurir : idKurir,
      namaKurir: namaKurir == null ? this.namaKurir : namaKurir,
      noHp: noHp == null ? this.noHp : noHp,
    );
  }
}