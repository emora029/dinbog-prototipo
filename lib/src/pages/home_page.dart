import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(43.0),
          child: SafeArea(
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.grey[200],
              title: _userName(context, 16, 15, 12),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.grey[700],),
                    onPressed: () {},
                  );
                },
              ),
            ),
          ),
        ),
        body: DefaultTabController(
          length: 6,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                SliverList(
                  delegate: SliverChildListDelegate(
                    _sliverListContact(context),
                  ),
                ),
              ];
            },
            body: _createContent()
          ),
        ),
        bottomNavigationBar: _bottomNavigationBar(context)
      ),
    );
  }

  Widget _createContent(){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal:18),
          child: TabBar(
            tabs: [
              _createTab('Post','54'),
              _createTab('Books','54'),
              _createTab('Videos','5'),
              _createTab('Music','10'),
              _createTab('Works','10'),
              Icon(Icons.info_outline, size:25, color: Colors.blue)
            ],
            indicatorColor: Colors.blue,
            indicatorWeight: 1.8,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              _showPosts(),
              _pageUnderConstruction(),
              _pageUnderConstruction(),
              _pageUnderConstruction(),
              _pageUnderConstruction(),
              _pageUnderConstruction()
            ],
          ),
        ),
      ],
    );
  }

  Widget _showPosts(){
    return ListView(
      children: <Widget>[
        Divider(
          height: 1,
          thickness: 5,
        ),
        _postWithImage(context, "assets/be18fb2927c8fdd98d2269a56eaa5f0f.jpg"),
        _postOnlyText(context, 'Today was a excellent photoshoot day!! with my all my loves.'),
        _postWithImage(context, "assets/1ddaf200d9e3bf55ec54b200dc0ec7b1.jpg"),
        _postOnlyText(context, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
        _postWithImage(context, "assets/cf363aadd935b0debceaba5f4c9a740a.jpg"),
        _postOnlyText(context, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. '),
        SizedBox(height: 15.0)
      ],
    );
  }

  Widget _postOnlyText(BuildContext context, String postOnlyTextDescription){

    double h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: h/50, vertical: h/80),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
          text: 'Karla Venom ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
          children: <TextSpan>[
            TextSpan(text: postOnlyTextDescription,
              style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w300)
              ),
            ]
          ),
        ),
      ),
    );
  }

  Widget _postWithImage(BuildContext context, String imgPost){

    double h = MediaQuery.of(context).size.height;
    final grey = Colors.grey[400];
    final styleUserdescription = TextStyle(fontSize: 12, color: Colors.grey);

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _profilePhoto(h/25),
                    SizedBox(width: h/70,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _userName(context, 12, 11, 9),
                        Text('Model', style: styleUserdescription,),
                        Text('10d ago', style: styleUserdescription,),
                      ],
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: grey, size: h/40,),
                  onPressed: () {},
                ),
              ]),
        ),
        Container(
          width: double.infinity,
          child: Image(
            height: 260,
            fit: BoxFit.scaleDown,
            image: AssetImage(imgPost), 
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              width: 69,
              padding: EdgeInsets.only(left: 5),
              child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.thumb_up, color: grey, size: 20,), label: Text('3', style: TextStyle(fontSize: 13, color: grey,),))
            ),
            Container(
              width: 69,
              child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.comment, color: grey, size: 20,), label: Text('3', style: TextStyle(fontSize: 13, color: grey,),))
            ),
            Container(
              width: 69,
              child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.reply, textDirection: TextDirection.rtl, color: grey, size: 20,), label: Text(''))
            ),
          ],
        ),
      ],
    );
  }

  Widget _pageUnderConstruction(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Page under construction'),
        Icon(Icons.build),
      ],
    );
  }

  Widget _userName(BuildContext context, double fontSizeUserName, double checkUserName, double verificationIconSize){
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Karla Venom ', style: TextStyle(color: Colors.black, fontSize: fontSizeUserName, fontWeight: FontWeight.w800),),
          Container(
            width: checkUserName,
            height: checkUserName,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Color.fromRGBO(17, 129, 195, 1.0)
            ),
            child: Icon(Icons.check, color: Colors.white, size: verificationIconSize,)
          ),
          SizedBox(width: 30,)
        ],
      ),
    );
  }

  Widget _createTab(String nameTab, String numberTab){
    return Tab( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(nameTab, style: TextStyle( fontSize: 12.5)),
          Text(numberTab, style: TextStyle( fontSize: 12.5)),
        ],
      )
    );
  }

  Widget _profilePhoto(double radiusProfile){
    return CircleAvatar(
      backgroundImage: AssetImage("assets/profile.jpg"), 
      radius: radiusProfile,
    );
  }

  Widget _profileInformation(BuildContext context){

    double h = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.fromLTRB(h/6.8, h/50, 0, h/50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _community('Following ', '376 '),
              _community('Follower ', '17k '),
              _community('Friends ', '305 '),
            ],
          ),
          SizedBox(height: h/115,),
          Row(
            children: <Widget>[
              Text('Model | Venezuela', textAlign: TextAlign.left, style: TextStyle(color: Color.fromRGBO(187, 187, 187, 1.0), fontSize: h/49.5),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _followButton(context),
              SizedBox(width: h/37,),
              _pendingButton(context)
            ],
          )
        ],
      ),
    );
  }

  Widget _community(String description, String number){
    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
          text: description,
          style: TextStyle(fontSize: 14.5, color: Colors.black, fontWeight: FontWeight.bold,),
          children: <TextSpan>[
            TextSpan(text: number,style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold, color: Color.fromRGBO(17, 129, 195, 1.0))),
            ]
          ),
        ),
        SizedBox(width: 10,),
      ],
    );
  }

  Widget _followButton(BuildContext context){

    double h = MediaQuery.of(context).size.height;

    return Row(
      children: <Widget>[
        ButtonTheme(
          height: h/25.0,
          minWidth: 90,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            color: Color.fromRGBO(17, 129, 195, 1.0),
            textColor: Colors.white,
            child: Text('Follow', style: TextStyle(fontSize: h/51.5)),
            onPressed: (){},
          ),
        ),
      ],
    );
  }

  Widget _pendingButton(BuildContext context){

    double h = MediaQuery.of(context).size.height;

    return Row(
      children: <Widget>[
        ButtonTheme(
          height: h/25.0,
          minWidth: 90,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: Color.fromRGBO(187, 187, 187, 1.0),)
            ),
            color: Colors.white,
            textColor: Color.fromRGBO(187, 187, 187, 1.0),
            child: Text('Pending', style: TextStyle(fontSize: h/51.5)),
            onPressed: (){},
          ),
        ),
      ],
    );
  }

  List<Widget> _sliverListContactInformation;

  List<Widget> _sliverListContact(BuildContext context) {
    _sliverListContactInformation ??= List.generate(1, (index) {
      return Stack(
        children: <Widget>[
          _profileInformation(context),
          Container(
            padding: EdgeInsets.only(left: 10, top:10),
            child: _profilePhoto(38.0)
          ),
        ],
      );
    });

    return _sliverListContactInformation;
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
        items: [
          BottomNavigationBarItem(
            icon: Icon( Icons.home),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.search),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.add_circle_outline),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.notifications_none),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.ondemand_video),
            title: Container()
          ),
        ],
      ),
    );
  }

}