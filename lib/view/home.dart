import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.grey,
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
        onPressed: (){
          print('Ready To Add note');
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Notes'),
      ),
      body: Container(
        padding:const EdgeInsetsDirectional.all(20),
        child: ListView(
          children: [
            itemBuild(),

          ],
        ),
      ),
    );
  }
}
Widget itemBuild(){
  return Dismissible(
    onDismissed: (direction){
      print('ready to Delete');
    },
    key: Key(UniqueKey().toString()),
    child: Card(
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        borderRadius:const BorderRadius.all(Radius.circular(10)),
        splashColor: Colors.pink,
        onTap: () {
          print('Edit');
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/notes.png',
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  )),
              const  SizedBox(
                width: 10,
              ),
              const Expanded(
                  flex: 3,
                  child: Text(
                    'Mostafa Hosam Will Play Football  Thrsday 20-2-2022 tonigt',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
