import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _height = 0, _weight = 0, _result = 0;
  final List<Map<String, double>> _history = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index'.toUpperCase()),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: const Text(
              "History",
            ),
          ),
          body: _history.isNotEmpty
              ? ListView.builder(
                  itemCount: _history.length,
                  itemBuilder: (context, index) {
                    final height = _history[index]["height"];
                    final weight = _history[index]["weight"];
                    final result = _history[index]["result"];
                    return ListTile(
                      title: Text(
                        "W: $weight kg - H: $height m",
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: Text("BMI = $result kg/m2"),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "No History",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.only(bottom: 20.0),
            child: TextField(
              onChanged: (value) => setState(() {
                _height = double.parse(value) / 100;
              }),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Height (cm)"),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (value) => setState(() {
                _weight = double.parse(value);
              }),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Weight (kg)"),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              "BMI = ${_result.toStringAsFixed(2)}",
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40.0),
            child: ElevatedButton(
              onPressed: () => setState(
                () {
                  _result = _weight / (_height * _height);
                  _history.insert(
                    0,
                    {
                      "height": _height,
                      "weight": _weight,
                      "result": double.parse(_result.toStringAsFixed(2))
                    },
                  );
                },
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                fixedSize: const Size(150.0, 15.0),
                textStyle: const TextStyle(fontSize: 20.0),
                shape: const StadiumBorder(),
              ),
              child: const Text("Calculate"),
            ),
          ),
        ],
      ),
    );
  }
}
