import 'package:drevol/constants/colors.dart';
import 'package:drevol/provider/home_provider.dart';
import 'package:drevol/provider/login_provider.dart';
import 'package:drevol/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  void afterBuildFunction(BuildContext context) {
    var homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.readJson();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      afterBuildFunction(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    var loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: AppColors.kBtnColor,
        title: Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
                onTap: () {
                  homeScreenProvider.logoutFun();
                  loginProvider.emailController.clear();
                  loginProvider.passwordController.clear();
                },
                child: Icon(Icons.logout)),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<HomeScreenProvider>(
            builder: (context, homeScreenProvider, _) {
          return homeScreenProvider.isLoading == false
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Card(
                                        child: ListTile(
                                          leading: Icon(Icons.search),
                                          title: TextField(
                                            readOnly: true,
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(Icons.cancel),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  color: AppColors.kMain,
                                  margin: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.sort_by_alpha,
                                    color: AppColors.kBtnColor,
                                  ),
                                )
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  homeScreenProvider.filteredUsersList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        height: 70,
                                        width: 70,
                                        child: Image.asset(
                                            "assets/images/logo.png"),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            height: 15,
                                            width: 70,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 10,
                                            width: 90,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 10,
                                            width: 80,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 10,
                                            width: 100,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        baseColor: Color(0xFFE0E0E0),
                        highlightColor: Color(0xFFF5F5F5),
                      ),
                    ],
                  ),
                )
              : Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Card(
                                    child: ListTile(
                                      leading: Icon(Icons.search),
                                      title: TextField(
                                        controller: searchController,
                                        decoration: InputDecoration(
                                            hintText: "Search",
                                            border: InputBorder.none),
                                        onChanged: homeScreenProvider
                                            .onSearchTextChanged,
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          searchController.clear();
                                          homeScreenProvider
                                              .onSearchTextChanged('');
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                homeScreenProvider.sortByName();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color: AppColors.kMain,
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.sort_by_alpha,
                                  color: AppColors.kBtnColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        homeScreenProvider.noSearchData == false
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    homeScreenProvider.filteredUsersList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: boxDecoration(),
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          height: 70,
                                          width: 70,
                                          child: Image.asset(
                                              "assets/images/logo.png"),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${homeScreenProvider.filteredUsersList[index]["username"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                "${homeScreenProvider.filteredUsersList[index]["email"]}"),
                                            Text(
                                                "${homeScreenProvider.filteredUsersList[index]["primary"]}"),
                                            Text(
                                                "${homeScreenProvider.filteredUsersList[index]["city"]}"),
                                            Text(
                                                "Product Ids : ${homeScreenProvider.filteredUsersList[index]["productIDs"]}")
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    homeScreenProvider.searchedList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: boxDecoration(),
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          height: 70,
                                          width: 70,
                                          child: Image.asset(
                                              "assets/images/logo.png"),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${homeScreenProvider.searchedList[index]["username"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                "${homeScreenProvider.searchedList[index]["email"]}"),
                                            Text(
                                                "${homeScreenProvider.searchedList[index]["primary"]}"),
                                            Text(
                                                "${homeScreenProvider.searchedList[index]["city"]}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
