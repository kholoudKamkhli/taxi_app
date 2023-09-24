import 'package:flutter/material.dart';

class OnboardOne extends StatelessWidget {
  static const String routeName = "Onboard1";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/img_1.png",height: MediaQuery.of(context).size.height*0.3,width: MediaQuery.of(context).size.width*0.5,),
          //const Text("Request Ride",style: ),
          const DefaultTextStyle(
            style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
            child: Text("Request Ride"),
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: const DefaultTextStyle(
              style: TextStyle(
                  fontSize:18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
              ),
              textAlign: TextAlign.center,
              child: Text("Rrequest a ride and get picked up by a nearby driver"),
            ),
          ),

        ],
      ),
    );
  }
}
