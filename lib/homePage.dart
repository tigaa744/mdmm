import 'package:flutter/material.dart';

import 'mdm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MdmCheck md = new MdmCheck();
  bool? isMD;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MDM Check"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text('${MdmCheck.statusMD}'),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    md.mdm();
                  });
                },
                child: Text('Check MDM'),
                color: Colors.blue,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Text('The result of MDM is $isMD'),
              MaterialButton(
                    color: Colors.blue,
                  child: Text("Check MDM V2 "),
                  onPressed: () {
                    setState(() {
                      isMD = md.isManagedByMDM();
                    });
                  }),
              MaterialButton(
                child: Text("removeMDMConfigurationProfiles"),
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    md.removeMDMConfigurationProfiles();
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: Text("removeMDMEnrollmentInformation"),
                  onPressed: () {
                    setState(() {
                      md.removeMDMEnrollmentInformation();
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: Text("Restart The Device"),
                  onPressed: () {
                    setState(() {
                      md.restartDevice();
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
