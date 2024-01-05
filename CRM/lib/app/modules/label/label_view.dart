import 'package:flutter/material.dart';

class LabelView extends StatefulWidget {
  const LabelView({Key? key}) : super(key: key);

  @override
  State<LabelView> createState() => _LabelViewState();
}

class _LabelViewState extends State<LabelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('+Add Label', style: TextStyle(fontSize: 16, color: Colors.deepPurple),),
                Text('Edit Labels', style: TextStyle(fontSize: 16, color: Colors.deepPurple),),
              ]
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1))]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.label_outline_rounded, color: Colors.black, size: 22,),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text('VIP', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      ]
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Center(child: Text('0', style: TextStyle(fontSize: 16, color: Colors.white),)),
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                ]
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1))]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.label_outline_rounded, color: Colors.black, size: 22,),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text('Customer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(child: Text('5', style: TextStyle(fontSize: 16, color: Colors.white),)),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ]
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1))]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.label_outline_rounded, color: Colors.black, size: 22,),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text('Suplier', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(child: Text('2', style: TextStyle(fontSize: 16, color: Colors.white),)),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ]
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1))]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.label_outline_rounded, color: Colors.black, size: 22,),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text('Project A', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(child: Text('0', style: TextStyle(fontSize: 16, color: Colors.white),)),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ]
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1))]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.label_outline_rounded, color: Colors.black, size: 22,),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text('Project B', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(child: Text('50', style: TextStyle(fontSize: 16, color: Colors.white),)),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ]
              ),
            ),
          ]
        ),
      )
    );
  }
}
