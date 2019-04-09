import 'package:flutter/material.dart';
import 'package:flutter_todo/home/home.dart';
import 'package:flutter_todo/idea/idea.dart';
import 'package:flutter_todo/index/navigation_icon_view.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _IndexPageState();
  }
}

// 要让主页面 Index 支持动效，要在它的定义中附加mixin类型的对象TickerProviderStateMixin
class _IndexPageState extends State<Index> with TickerProviderStateMixin {
  int _currenIndex = 0; // 当前界面的索引值
  List<NavigationIconView> _navigationIconview; // 底部图标按钮区域
  List<StatefulWidget> _pageList; // 用来存放我们的图标对应的页面
  StatefulWidget _currentPage; // 当前的显示页面


  // 定义一个空的设置状态值的方法
  void _rebuild() {
    setState((){});
  }
  @override
  void initState() {
    super.initState();

    // 初始化导航图标
    _navigationIconview = <NavigationIconView>[
      new NavigationIconView(
          icon: new Icon(Icons.home), title: new Text('Home'), vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.settings),
          title: new Text('Setting'),
          vsync: this),
    ];


    // 将我们 bottomBar 上面的按钮图标对应的页面存放起来，方便我们在点击的时候
    for (NavigationIconView value in _navigationIconview) {
      value.controller.addListener(_rebuild);
    }
    _pageList =<StatefulWidget>[
      new HomePage(),
      new Idea(),

    ];

  _currentPage=_pageList[_currenIndex]; //给一个初始的页面


  }

  @override
  Widget build(BuildContext context) {
  final BottomNavigationBar bottomNavigationBar =new BottomNavigationBar(
      items: _navigationIconview
          .map((NavigationIconView navigationitem)=> navigationitem.item)
          .toList(),//添加idcon
    currentIndex: _currenIndex,// 当前点击的索引值
    type: BottomNavigationBarType.fixed,
    // 点击之后，需要触发的逻辑事件
    onTap: (int index){
      _navigationIconview[_currenIndex].controller.reverse();
    _currenIndex=index;
      _navigationIconview[_currenIndex].controller.forward();
      _currentPage = _pageList[_currenIndex];
    },
  );
 return MaterialApp(
   home: new Scaffold(
     body: Center(
       child: _currentPage,
     ),
     bottomNavigationBar: bottomNavigationBar,
   ),

   theme: new ThemeData(

       primarySwatch: Colors.blue,
   ),
 );

  }
}
