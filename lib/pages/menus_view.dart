import 'package:antree/components/menu_tile.dart';
import 'package:antree/pages/purchase_view.dart';
import 'package:antree/themes.dart';
import 'package:flutter/material.dart';

class MenusView extends StatefulWidget {
  @override
  _MenusViewState createState() => _MenusViewState();
}

class _MenusViewState extends State<MenusView>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  TabController _controller;
  final List<String> menus = ['Recomended', 'Limited Offers', 'Baverage'];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: menus.length, vsync: this);
  }

  Widget bottomSheetMenu() {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          ListTile(
            isThreeLine: true,
            title: Text(
              'Whopper Meal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            subtitle: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text('+Medium Fries +Medium Drinks'),
            ),
            trailing: Text('Rp 54.400',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 32,
                  child: FloatingActionButton(
                    child: Icon(Icons.remove),
                    heroTag: null,
                    onPressed: () {
                      setState(() {
                        // if (_customerCount > 0) _customerCount--;
                      });
                    },
                  ),
                ),
                Text('0',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                Container(
                  height: 32,
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    heroTag: null,
                    onPressed: () {
                      setState(() {
                        // _customerCount++;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'Add to Basket - 54.400',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Burger King'),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    'http://www.burgerking.com.my/upload/image/offer/79/Double%20King_900pxx480px.png',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.4),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliversMenuHeaderDelegate(
                child: Container(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.black87,
                controller: _controller,
                isScrollable: true,
                tabs: menus.map((String menu) {
                  return Tab(
                    text: menu,
                  );
                }).toList(),
              ),
            )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                      child: MenuTile(
                        onTap: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return bottomSheetMenu();
                              });
                        },
                      ),
                    ),
                childCount: 10),
          )
        ],
      ),
      bottomSheet: Container(
        height: 64,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.blue,
          child: Text('ORDER', style: AntreeThemes.heading),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PurchaseView()));
          },
        ),
      ),
    );
  }
}

class SliversMenuHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  SliversMenuHeaderDelegate({this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => 64.0;

  @override
  double get minExtent => 64.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
