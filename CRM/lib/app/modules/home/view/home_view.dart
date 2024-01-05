import 'package:carousel_slider/carousel_slider.dart';
import 'package:crm/app/modules/signin/view/signin_option_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SliderScreenView extends StatefulWidget {
  @override
  _SliderScreenViewState createState() => _SliderScreenViewState();
}

class _SliderScreenViewState extends State<SliderScreenView> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<SliderItem> _sliderItems = [
    SliderItem(
      image: AssetImage('assets/slider_2.jpg'),
      text: 'Powerfull Mobile CRM',
      text2:
          'Create task, reminders, notes & follow-up during and after phone calls.',
    ),
    SliderItem(
      image: AssetImage('assets/slider_3.jpg'),
      text: 'Turn your calls & sms into customers',
      text2:
          'Leader CRM helps you close more deals by organizing your leads & customers.',
    ),
    SliderItem(
      image: AssetImage('assets/slider_1.jpg'),
      text: 'Discover everything about your leads and customers',
      text2:
          'Leverage your sales pitch by revealing social profiles, latest news and company details.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  //allowImplicitScrolling: true,
                  controller: _pageController,
                  itemCount: _sliderItems.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _sliderItems[index];
                  },
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildDots(),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(SignInOptionView());
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => SignInOptionView(),
                            // ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _sliderItems.length,
        (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index ? Colors.deepPurple : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  final ImageProvider image;
  final String text;
  final String text2;

  SliderItem({required this.image, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(image: image),
        //SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.deepPurple),
            textAlign: TextAlign.center,
          ),
        ),
        //SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Text(
            text2,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
