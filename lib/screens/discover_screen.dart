import 'package:flutter/material.dart';
import 'package:news_app_ui_design/models/news_item_model.dart';
import 'package:news_app_ui_design/widgets/news_item_card.dart';
import 'package:news_app_ui_design/widgets/tab_widget.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Politic", // index = 0
      "Sport", // index = 1
      "Education", // index = 2
      "Game",
      "Weather"
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "News from all around world",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Search",
                      ),
                      const Spacer(),
                      Image.asset("assets/images/slider.png", width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                TabWidget(
                  title: "All",
                  isActive: true,
                  onTap: () {},
                ),
                const SizedBox(width: 10),
                for (int index = 0; index < titles.length; index++)
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TabWidget(title: titles[index], onTap: () {}),
                  )
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  NewsItemCard(
                    newsItem: NewsItem(
                      image: "https://www.bangor.ac.uk/sites/default/files/2021-08/CB_BU_30_10_19__S7_Canon_216.jpg",
                      category: "Sport",
                      title: "What Training do volleyball players need",
                      ownerName: "McKindney",
                      ownerImage: "https://userstock.io/data/wp-content/uploads/2017/09/ilaya-raja-280339-1024x981.jpg",
                      createdAt: "Fev 27,2023",
                    ),
                  ),
                  const SizedBox(height: 20),
                  for(int index = 0; index < 6; index++)
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: NewsItemCard(
                      newsItem: NewsItem(
                        image: "https://www.bangor.ac.uk/sites/default/files/2021-08/CB_BU_30_10_19__S7_Canon_216.jpg",
                        category: "Sport",
                        title: "What Training do volleyball players need",
                        ownerName: "McKindney",
                        ownerImage: "https://userstock.io/data/wp-content/uploads/2017/09/ilaya-raja-280339-1024x981.jpg",
                        createdAt: "Fev 27,2023",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
