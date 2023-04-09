import 'package:flutter/material.dart';

import 'mdm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MdmCheck md = new MdmCheck();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MDM Check"),

      ),
    body: Column(

      children: [

Text('${MdmCheck.statusMD}'),
        SizedBox(height: 10,),
        MaterialButton(

          onPressed: ()
        {
          setState(() {
            md.mdm();
          });

        },

child: Text('Check MDM'),
          color: Colors.blue,
    ),
   SizedBox(height: 10,),

MaterialButton(
    child: Text("Remove MDM"),
    color: Colors.blue,
    onPressed: (){
setState(() {
  md.removeMDMConfigurationProfiles();
  md.removeMDMEnrollmentInformation();

});

}

),
      SizedBox(height: 10,),
        MaterialButton(
          color: Colors.blue,
            child: Text("Restart The Device"),

            onPressed: (){

          setState(() {
md.restartDevice();
          });
        }

        )

      ],

    ),
    );
  }
}
