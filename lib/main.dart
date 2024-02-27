import 'package:flutter/material.dart';
void main()
{
  runApp(bmi());
}
class bmi extends StatelessWidget {
  const bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bmi1(),
    );
  }
}
class bmi1 extends StatefulWidget {
  const bmi1({super.key});

  @override
  State<bmi1> createState() => _bmi1State();
}

class _bmi1State extends State<bmi1> {

  var wt= TextEditingController();
  var feet=TextEditingController();
  var inch=TextEditingController();
  var result="";
  var bg= Colors.white;
  var msg1="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar

        (
        title: Text("YOUR BMI",),
      ),

      body: Container(
        color:bg,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(
                  fontSize: 35,fontWeight: FontWeight.w800,
                ),),
                SizedBox(height: 20,),
                TextField(
                  controller: wt ,
                  decoration: InputDecoration(
                    label: Text("ENTER YOUR WEIGHT IN Kgs"),
                        prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: feet ,
                  decoration: InputDecoration(
                      label: Text("ENTER YOUR HEIGHT IN FEET"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: inch ,
                  decoration: InputDecoration(
                      label: Text("ENTER YOUR HEIGHT IN INCHES"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){
                  var wt1=wt.text.toString();
                  var ft=feet.text.toString();
                  var inc=inch.text.toString();

                  if(wt1!= "" && ft!=""&& inc!=""){
                    var iwt =int.parse(wt1);
                    var ift=int.parse(ft);
                    var iinc=int.parse(inc);

                    var tinch=(ift* 12)+(iinc);
                    var tcm= tinch * 2.54;
                    var tm= tcm/100;
                    var bmi=iwt/(tm * tm);
                    var msg="";
                    if(bmi >25)
                      {
                        msg= " YOU ARE OBESE";
                        bg=Colors.orange.shade200;
                        
                      }
                    else if(bmi <18)
                      {
                        msg="YOU ARE UNDERWEIGHT ";
                        bg=Colors.red.shade200;
                      }
                    else
                      {
                        msg="YOU ARE HEALTHY !!";
                        bg=Colors.green.shade200;
                      }
                     setState(() {
                       result=bmi.toStringAsFixed(2);
                       msg1=msg;
                     });


                  }
                  else{
                    setState(() {
                      result= "PLEASE FILL ALL THE COLUMN";
                    });
                  }
                },
                    child: Text("CALCULATE BMI")),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                Text("THE BMI OF YOUR BODY IS:",style: TextStyle(
                  fontSize: 20
                ),),
                SizedBox(height: 10,),

                Text(result,style: TextStyle(
                  fontSize: 20
                ),),
                SizedBox(height: 10,),
                Text(msg1,style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

