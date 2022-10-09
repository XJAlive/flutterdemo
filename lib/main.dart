import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent),
      home: const MyHomePage(
        title: 'Welcome to Flutter',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  // State<MyHomePage> createState() => _MyHomePageState();
  State<MyHomePage> createState() => _ListViewState();
}

class _ListViewState extends State<MyHomePage> {
  var list = List.generate(20, (index) => WordPair.random());
  var favorites = <WordPair>{};

  /*
  带结果返回的页面跳转
   */
  navigate() async {
    var result =
        await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      var param = ModalRoute.of(context)?.settings.arguments ?? "0";
      final tiles = favorites.map(
        (pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      );
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }

  Widget bindListView() {
    var scrollController = ScrollController();
    scrollController.addListener(() {
      print('当前滚动距离：${scrollController.offset}');
    });

    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return bindItemView(list[i]);
      },
      controller: scrollController,
      separatorBuilder: (context, i) {
        return Divider();
      },
    );
  }

  Widget bindItemView(WordPair wordPair) {
    var favorite = favorites.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        favorite ? Icons.favorite : Icons.favorite_border,
        color: favorite ? Colors.redAccent : null,
      ),
      onTap: () {
        setState(() {
          if (favorite) {
            favorites.remove(wordPair);
          } else {
            favorites.add(wordPair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('执行State的build方法');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
        actions: [
          IconButton(
              onPressed: () {
                navigate();
              },
              icon: const Icon(Icons.list))
        ],
      ),
      body: Stack(
        children: [
          bindListView(),
          Positioned(
              bottom: 30,
              right: 30,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      var fragments = List.generate(
                          5, (index) => Page(text: index.toString()));
                      return Scaffold(
                        appBar: AppBar(title: Text("PageView")),
                        body: PageView(
                          children: fragments,
                        ),
                      );
                    }));
                  },
                  child: Text("测试ViewPager")))
        ],
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    super.build(context);
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }

  @override
  bool get wantKeepAlive => true;
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: DefaultTextStyle(
            style: TextStyle(fontSize: 17, color: Colors.pinkAccent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: TextStyle(color: Colors.teal),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/ic_header_share_ma.png",
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                        ),
                        width: 60,
                        height: 60,
                      )
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text("悬浮按钮")),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add_alarm_sharp),
                    label: Text("普通文案图标")),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: double.infinity),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("hi"),
                      Text("world"),
                    ],
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
