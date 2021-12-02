import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uts1/item_detail.dart';
import 'package:uts1/cari.dart';
import 'package:uts1/constants.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  static final ProdukList _produkList = ProdukList();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchInterval(_produkList.produk),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          shape: Border(
            bottom: BorderSide(
              color: Colors.grey[700]!,
              width: 1,
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.shade900,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          title: Image.asset(
            'assets/images/fujifilm_banner.png',
            width: 150,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Consumer<SearchInterval>(builder: (_, searchProvider, __) {
                return TextFormField(
                  controller: searchProvider.searchControl,
                  onTap: () {
                    FocusScope.of(context).requestFocus(
                      searchProvider.focusNode,
                    );
                  },
                  onChanged: searchProvider.searchOperation,
                  onEditingComplete: () {
                    searchProvider.cari = false;
                    FocusScope.of(context).unfocus();
                  },
                  focusNode: searchProvider.focusNode,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16.0),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (searchProvider.cari) {
                          searchProvider.searchResult.clear();
                          searchProvider.searchControl.clear();
                          searchProvider.cari = false;
                          FocusScope.of(context).unfocus();
                        } else {
                          searchProvider.cari = true;
                          FocusScope.of(context).requestFocus(
                            searchProvider.focusNode,
                          );
                        }
                      },
                      icon: searchProvider.iconSearch,
                    ),
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                );
              }),
            ),
            const SizedBox(height: 16.0),
            Consumer<SearchInterval>(
              builder: (context, searchProvider, child) {
                List<ProdukList> listData = searchProvider.cari
                    ? searchProvider.searchResult
                    : _produkList.produk;
                if (listData.isEmpty) {
                  return const Center(
                    child: Text('Searching not found!'),
                  );
                }
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: searchProvider.cari
                      ? searchProvider.searchResult.length
                      : _produkList.produk.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: _buildItemList(
                        context: context,
                        produkList: listData[index],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemList({
    required BuildContext context,
    required ProdukList produkList,
  }) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
            color: Color(produkList.warna!),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Limited Edition',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Instax ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: produkList.tipe!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '\$ ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: produkList.harga!.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return ItemDetailScreen(produkList);
                      },
                    ),
                  );
                },
                child: Text(
                  'Buy',
                  style: TextStyle(
                    color: Color(produkList.warna!),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 20.0,
          bottom: 20.0,
          child: Image.asset(
            produkList.gambar!,
            height: 150.0,
          ),
        ),
      ],
    );
  }
}
