import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Bismilah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Tugas Mobile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();

  List<String> SatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];

  String selectedDropdown = "Kelvin";

  double hasilKonversi = 0.0;

  List<String> hasil = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: etInput,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Celcius',
                  hintText: 'enter the temperature in celcius'),
            ),
            const SizedBox(
              height: 8,
            ),
            DropdownButton(
              isExpanded: true,
              value: selectedDropdown,
              items: SatuanSuhu.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                dropdownchanged();
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Hasil',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              "$hasilKonversi",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (etInput.text.isNotEmpty) {
                          switch (selectedDropdown) {
                            case "Kelvin":
                              hasilKonversi = int.parse(etInput.text) + 273.15;
                              break;
                            case "Reamur":
                              hasilKonversi = int.parse(etInput.text) * 4 / 5;
                              break;
                            case "Fahrenheit":
                              hasilKonversi =
                                  (int.parse(etInput.text) * 9 / 5) + 32;
                              break;
                            default:
                          }
                          hasil.add("hasil konversi dari: " +
                              etInput.text +
                              "Derajat celcius" +
                              selectedDropdown +
                              "Yang Menghasilkan: " +
                              hasil.toString());
                        }
                      });
                    },
                    child: Text("Konversi Suhu"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Riwayat Konversi",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: hasil.length,
                  itemBuilder: (context, index) {
                    return Text(
                      hasil[index],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void dropdownchanged() {
    return setState(() {
      selectedDropdown = toString();
    });
  }
}
