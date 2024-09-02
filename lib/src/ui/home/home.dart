import 'package:apptest/src/config/config.dart';
import 'package:apptest/src/ui/widgets/adaptive/adaptive.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Positioned.fill(
            child: ColoredBox(color: Colors.white, child: SizedBox.expand())),
        Positioned.fill(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 226 + 56,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      primaryMaterialColor.shade500,
                      primaryMaterialColor.shade700,
                      primaryMaterialColor.shade900,
                      primaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const SizedBox.expand(),
              ),
              const Expanded(
                  child: ColoredBox(
                      color: Colors.white, child: SizedBox.expand())),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            "assets/images/vector_masjid.png",
            color: fieldBgColor,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 56,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu_rounded, color: Colors.white),
              ),
              elevation: 0,
              title: const Text(
                "Home Application",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_rounded,
                      color: Colors.white),
                )
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 226,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  controller: _searchController,
                                  decoration: _searchDecoration,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Assalamualaikum",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Ramadhani Azhar",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Next Pray : Subuh",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "04:00",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 226,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 2, 16, 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const ColoredBox(
                            color: fieldBgDisableColor,
                            child: Center(
                              child: Text("Berita Terbaru"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: _layanan()),
                  SliverToBoxAdapter(child: _viewMap())
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 12),
              child: Material(
                color: Colors.white,
                elevation: 4,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/home.png",
                        width: 26,
                        height: 26,
                      ),
                      Image.asset(
                        "assets/icons/masjid.png",
                        width: 26,
                        height: 26,
                      ),
                      Image.asset(
                        "assets/icons/people.png",
                        width: 26,
                        height: 26,
                      ),
                      Image.asset(
                        "assets/icons/profile.png",
                        width: 26,
                        height: 26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _layanan() {
    const layananSize = Size(110, 140);
    final layananList = [
      "Taklim",
      "Ziswaf",
      "Doa & Dzikir",
      "Pasar Islam",
      "Khazanah",
      "Rutinitas",
      "Qurban",
      "Laporan"
    ];
    return AdaptiveLayout(builder: (context, config) {
      final crossAxisCount = (config.crossAxisCount(layananSize.width)).toInt();
      final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 2,
        crossAxisSpacing: 6,
        mainAxisExtent: layananSize.height,
      );
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 2),
        child: GridView.builder(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: gridDelegate,
          itemCount: layananList.length,
          itemBuilder: (context, index) {
            final layanan = layananList[index];
            return InkWell(
              child: SizedBox.expand(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: SizedBox(
                          width: 82,
                          height: 82,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/images/vector_masjid.png",
                                      fit: BoxFit.cover,
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 2),
                        child: Text(
                          layanan,
                          style: const TextStyle(
                            color: primaryTextColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  get _searchDecoration => InputDecoration(
        filled: true,
        fillColor: fieldBgColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        border: normalBorder,
        focusedBorder: focusBorder,
        errorBorder: errorBorder,
        hintText: "search !",
        hintStyle: const TextStyle(
          fontSize: 14,
          color: secondaryTextColor,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
        ),
      );

  final normalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
    gapPadding: 2,
  );

  final focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
    gapPadding: 2,
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
    gapPadding: 2,
  );

  final _searchController = TextEditingController();

  _viewMap() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 2, 16, 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Masjid Terdekat",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: double.maxFinite,
            height: 226,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/view_map.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
