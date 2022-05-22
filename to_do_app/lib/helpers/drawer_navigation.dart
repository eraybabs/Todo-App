import 'package:flutter/material.dart';

import '../screen/categories_screen.dart';

import '../screen/home_screen.dart';

import '../screen/todos_by_category.dart';

import '../services/category_service.dart';

class DrawerNavigaton extends StatefulWidget {

  @override

  _DrawerNavigatonState createState() => _DrawerNavigatonState();

}

class _DrawerNavigatonState extends State<DrawerNavigaton> {

  List<Widget> _categoryList = List<Widget>();

  CategoryService _categoryService = CategoryService();

  @override

  initState() {

    super.initState();

    getAllCategories();

  }

  getAllCategories() async {

    var categories = await _categoryService.readCategories();

    categories.forEach((category) {

      setState(() {

        _categoryList.add(InkWell(

          onTap: () => Navigator.push(

              context,

              new MaterialPageRoute(

                  builder: (context) => new TodosByCategory(category: category['name'],))),

          child: ListTile(

            title: Text(category['name']),

          ),

        ));

      });

    });

  }

  @override

  Widget build(BuildContext context) {

    return Container(

      child: Drawer(

        child: ListView(

          children: <Widget>[

            UserAccountsDrawerHeader(

              currentAccountPicture: CircleAvatar(

                backgroundImage: NetworkImage(
                    'https://www.woolha.com/media/2020/03/eevee.png'),
              ),

              accountName: Text('Eray Altun'),

              accountEmail: Text('eray_altun_25@hotmail.com'),

              decoration: BoxDecoration(color: Colors.blue),

            ),

            ListTile(

              leading: Icon(Icons.home),

              title: Text('Home'),

              onTap: () => Navigator.of(context)

                  .push(MaterialPageRoute(builder: (context) => HomeScreen())),

            ),

            ListTile(

              leading: Icon(Icons.view_list),

              title: Text('Categories'),

              onTap: () => Navigator.of(context).push(

                  MaterialPageRoute(builder: (context) => CategoriesScreen())),

            ),

            Divider(),

            Column(

              children: _categoryList,

            ),

          ],

        ),

      ),

    );

  }

}