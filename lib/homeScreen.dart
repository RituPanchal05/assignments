import 'package:flutter/material.dart';
import 'package:assignments/food_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Search Food',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            leading: Container(
              margin: const EdgeInsets.all(6),
              height: height * 0.6,
              width: width * 0.6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 197, 197, 197).withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: const Offset(5, 10), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'Assets/back.png',
                  height: 10,
                  width: 10,
                ),
              ),
            ),
            actions: [
              Container(
                height: height * 0.06,
                width: width * 0.12,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 197, 197, 197).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: const Offset(5, 10), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xffFECC4C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'Assets/person1.png',
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height * 0.06,
                width: width * 0.66, // Adjust margin as needed
                decoration: BoxDecoration(
                  color: const Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'Assets/search1.png',
                    ),
                    hintText: 'Spice food',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      height: 4,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
              Container(
                height: height * 0.06,
                width: width * 0.14, // Adjust margin as needed
                decoration: BoxDecoration(
                  color: const Color(0xffFECC4C),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    'Assets/filter.png',
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 150,
            child: Transform.translate(
              offset: Offset(-100, 50), // Translate the text downwards by 50 units
              child: const Text(
                'Found 80 results',
                softWrap: true,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 50.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: GlobalVariables.foodData.length,
                itemBuilder: (context, index) {
                  return Transform.translate(
                    offset: Offset(0, index % 2 != 0 ? 50 : 100), 
                    child: FoodCard(food: GlobalVariables.foodData[index]),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final Map<String, dynamic> food;

  FoodCard({required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 197, 197, 197).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(5, 5), 
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -50),
              child: Image.asset(
                food['image']!,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  food['name'],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Text(
                    food['desc'],
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.local_fire_department, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      '${food['colories']} Calories',
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
                Text(
                  '\$${food['price']}',
                  style: const TextStyle(fontSize: 33, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
