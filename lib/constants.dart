class ProdukList {
  final String? tipe;
  final String? gambar;
  final num? harga;
  final int? warna;

  ProdukList({
    this.tipe,
    this.gambar,
    this.harga,
    this.warna,
  });

  List<ProdukList> get produk => [
        ProdukList(
          tipe: '  Mini Mint 7+',
          gambar: 'assets/images/InstaxMini7plus_Mint_R.png',
          harga: 49.90,
          warna: 0xff70b1a1,
        ),
        ProdukList(
          tipe: ' Mini Blue 7+',
          gambar: 'assets/images/InstaxMini7plus_Blue_R.png',
          harga: 50.90,
          warna: 0xff77a0c6,
        ),
        ProdukList(
          tipe: ' Mini Choral 7+',
          gambar: 'assets/images/InstaxMini7plus_Choral_R.png',
          harga: 51.90,
          warna: 0xffb0463c,
        ),
        ProdukList(
          tipe: ' Mini Pink 7+',
          gambar: 'assets/images/InstaxMini7plus_Pink_R.png',
          harga: 52.90,
          warna: 0xfffcf9496,
        ),
        ProdukList(
          tipe: ' Mini Lavender 7+',
          gambar: 'assets/images/InstaxMini7plus_Lavender_R.png',
          harga: 53.90,
          warna: 0xff855f8c,
        ),
      ];
}
