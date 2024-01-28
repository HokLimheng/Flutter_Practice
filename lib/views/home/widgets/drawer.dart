import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(image: NetworkImage("https://th.bing.com/th/id/OIP.6kHMp3QH7uAFyzTbauvJLAHaKe?rs=1&pid=ImgDetMain"),
                        fit: BoxFit.cover)
                ),
              ),

              accountName: Text('Luffy'),
              accountEmail: Text('Luffy@gmail.com'),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),ListTile(
              onTap: (){},
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
