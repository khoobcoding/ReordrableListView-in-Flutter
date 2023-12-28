import 'package:flutter/material.dart';

class ReorderableListViewApp extends StatefulWidget {
  const ReorderableListViewApp({super.key});

  @override
  State<ReorderableListViewApp> createState() => _ReorderableListViewAppState();
}

class _ReorderableListViewAppState extends State<ReorderableListViewApp> {
  bool isascending=true;
  List<String> data = [
    "IT",
    "Programming",
    "Media",
    "System Analyst",
    "Pharma",
    "Business Executive",
    'Chemicals',
    'Construction',
    'Financial Services',
    'Foodservice',
    'Healthcare',
    'Agriculture',
    'Creativity',
    'Project management',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: const Text(
            'Reorderable ListView',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
              isascending==true?  data.sort():data=List.from(data.reversed);
                setState(() {
                  
                });
                isascending=!isascending;
              },
              backgroundColor: Colors.amber,
              child: const Icon(Icons.sort),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                data.shuffle();
                setState(() {
                  
                });
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.shuffle),
            )
          ],
        ),
        body:ReorderableListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final mydata=data[index];
            return Card(
              key: ValueKey(mydata),
              color: Colors.cyan,elevation: 5,margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(mydata,style: const TextStyle(fontSize: 20,
                color: Colors.white,fontWeight: FontWeight.bold),),
                leading: CircleAvatar(backgroundColor: Colors.indigo,
                child: Text(mydata.characters.first,style: const TextStyle(
                  fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold
                ),),),
                trailing: const Icon(Icons.drag_handle),
              ),
            );
          },
          autoScrollerVelocityScalar: 20,
          // reverse: true,
          header: Container(
            padding: const EdgeInsets.all(15),color: Colors.red ,
            child: const Text("Company's List",style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
            ),),
          ),
          footer: Container(
            padding: const EdgeInsets.all(15),color: Colors.amber ,
            child: Center(
              child: const Text("ADVERTISEMENT",style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 44, 43, 43)
              ),),
            ),
          ),
          proxyDecorator: (child, index, animation) {
            return Container(decoration: BoxDecoration(
              color: Colors.white,border: Border.all(color: Colors.black,
              width: 5),
            ),child: child,);
          },
          onReorder: (oldIndex, newIndex) {
            print('old Index $oldIndex new Index $newIndex');
            if(newIndex>oldIndex){
              newIndex=newIndex-1;
              print('old Index $oldIndex new Index $newIndex');
            }
            final element=data.removeAt(oldIndex);
            data.insert(newIndex, element);
            setState(() {
              
            });
          },
        ));
  }
}
