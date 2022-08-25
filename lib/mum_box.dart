import "package:flutter/material.dart";

class mum extends StatelessWidget {
  final child;
  const mum({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: EdgeInsets.all(12),
      child: Center(child:child),
      decoration: BoxDecoration(color:Colors.grey[300],
      borderRadius: BorderRadius.circular(32),
         boxShadow: const [
                   //dark shadow bottom right
                   BoxShadow(
                    color:Color.fromARGB(252, 203, 190, 190),
                    blurRadius: 15,
                    offset:Offset(5, 5)
                   ),
               // light side
                   BoxShadow(
                    color:Colors.white,
                    blurRadius: 15,
                    offset:Offset(-5,-5)
                   )
                  ]
      )
    );
  }
}