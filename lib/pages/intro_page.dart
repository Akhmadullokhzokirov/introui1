import 'package:flutter/material.dart';
import 'package:introui/pages/home_page.dart';
import 'package:introui/utilis/Strings.dart';

class Intropage extends StatefulWidget {
  static final String id = "intro_page";

  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //change
    //
    //update
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       Navigator.pushReplacementNamed(context, HomePage.id);
        //     },
        //     child: Padding(
        //       padding: EdgeInsets.only(left: 20, right: 20),
        //       child: Text(
        //         "Skip",
        //         style: TextStyle(color: Colors.red, fontSize: 18),
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Stack(
        //alignment: Alignment.bottomCenter,
        //alignment: Alignment.bottomRight, // for body

        alignment: Alignment.bottomLeft,

        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: "assets/images/image_1.png",
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: "assets/images/image_2.png",
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: "assets/images/image_3.png",
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          Positioned( // if you want to write Skip in the Appbar,
            // just close from 80 to 96 row, and open appbar's commit,
            // and change bottomRight to  bottomCenter
            bottom: 0,
            right: 0,
            child:  Visibility(
              visible: currentIndex == 2,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, HomePage.id);
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Skip",style: TextStyle(color: Colors.red,fontSize: 18),),
                ),
              ),
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
              //  SizedBox(height: 30,),
              Text(
                content,
                style: TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == 1) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
