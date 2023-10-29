import 'package:flutter/material.dart';
import 'package:flutter_advanced_ui/models/hotel_model.dart';
import 'package:flutter_advanced_ui/shared/theme_constants.dart';
import 'package:flutter_advanced_ui/shared/widget_extention.dart';
import 'package:flutter_advanced_ui/widgets/home_tab_bar_widget.dart';
import 'package:flutter_advanced_ui/widgets/hotel_card_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  int _activeTab = 0;
  int _activeCardIndex = 0;

  final SwipeableCardSectionController _controller = SwipeableCardSectionController();

  final List<HotelModel> _hotels = [
    const HotelModel(
      image: "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&q=80&w=2970&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Aswan Resort",
      location: "Aswan, Egypt",
    ),

    const HotelModel(
      image: "https://unsplash.com/photos/AH8zKXqFITA/download?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjk4MjYwNDM5fA&force=true&w=1920",
      name: "Siargao Luxury Resort",
      location: "Siargao Island, Philippines",
    ),

    const HotelModel(
      image: "https://unsplash.com/photos/61OONDO7nrU/download?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjk4MjYwNTI3fA&force=true&w=1920",
      name: "Matanchén Resort",
      location: "Matanchén, Nay., México",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: List.generate(7, (index) => HomeTabBarWidget(
                label: "All",
                count: 124,
                isActive: _activeTab == index,
                onTap: () {
                  setState(() {
                    _activeTab = index;
                  });
                },
              )).addSeparator(SizedBox(width: context.screenWidth * 0.03)),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular Hotels",
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(right: 0),
                        child: const Row(
                          children: [
                            Text("See all",
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 16,
                                )),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_forward_ios_rounded, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.screenWidth,
            child: SwipeableCardsSection(
              cardController: _controller,
              context: context,
              //add the first 3 cards (widgets)
              items: [
                HotelCardView(hotelModel: _hotels[0]),
                HotelCardView(hotelModel: _hotels[1]),
                HotelCardView(hotelModel: _hotels[2]),
              ],
              //Get card swipe event callbacks
              onCardSwiped: (dir, index, widget) {
                //Add the next card using _cardController
                _controller.addItem(widget);

                //Take action on the swiped widget based on the direction of swipe
                //Return false to not animate cards
                _activeCardIndex = index + 1;
                setState(() {

                });
              },
              //
              enableSwipeUp: true,
              enableSwipeDown: false,
            ),
          ),
          const SizedBox(height: 12),
          AnimatedSmoothIndicator(
            activeIndex: _activeCardIndex,
            count: _hotels.length,
            effect: const ScrollingDotsEffect(
              dotColor: AppColors.greyColor,
              activeDotColor: AppColors.secondary,
              dotWidth: 9,
              dotHeight: 9,
            ),
          )
        ],
      ),
    );
  }
}
