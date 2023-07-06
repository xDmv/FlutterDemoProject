
import 'package:example_app/pages/third_party_services/maps/google_maps_page.dart';
import 'package:example_app/pages/third_party_services/maps/mapbox_page.dart';
import 'package:flutter/material.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  static const path = '/maps';

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> with TickerProviderStateMixin {
  final _pages = [
    const GoogleMapsPage(),
    const MapboxPage(),
    // const GoogleMapsPage(),
  ];
  int _selectedIndex = 0;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _pages.length);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onIndexChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'GoogleMaps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Mapbox',
          ),
        ],
      ),
    );
  }

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = index;
    });
  }
}
