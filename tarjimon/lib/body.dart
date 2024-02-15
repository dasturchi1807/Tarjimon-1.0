import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var tillar = [
    "Hindi",
    "English",
    "O'zbek",
    "Arabic",
    "Azerbaijani",
    "Spanish",
    "German",
    "Japanese",
    "Korean",
    "Kyrgyz",
    "Russian",
    "Tajik",
    "Turkish"
  ];

  var til1 = 'Dan';
  var til2 = 'Ga';
  var natija = "Bo'sh...";
  TextEditingController matnBoshqaruvi = TextEditingController();

  void tarjimon(String til1, String til2, String kiritish) async {
    GoogleTranslator translator = GoogleTranslator();
    var tarjima = await translator.translate(kiritish, from: til1, to: til2);
    setState(() {
      natija = tarjima.text.toString();
    });
  }

  String tilKodiniOlish(String til) {
    if (til == 'English') {
      return 'en';
    } else if (til == "O'zbek") {
      return 'uz';
    } else if (til == "Russian") {
      return 'ru';
    } else if (til == "Hindi") {
      return 'hi';
    } else if (til == "Arabic") {
      return 'ar';
    } else if (til == "Azerbaijani") {
      return 'az';
    } else if (til == "Spanish") {
      return 'es';
    } else if (til == "German") {
      return 'de';
    } else if (til == "Japanese") {
      return 'ja';
    } else if (til == "Korean") {
      return 'ko';
    } else if (til == "Kyrgyz") {
      return 'ky';
    } else if (til == "Tajik") {
      return 'tg';
    } else if (til == "Turkish") {
      return 'tr';
    }
    return '--';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(children: [
          // Ilovaning yuqoridagi tillarni tanlovchi tugmalari
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.only(left: 20),
              // color: Colors.orange,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(10.0, 10.0),
                            color: Colors.black26,
                            blurRadius: 10.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: const LinearGradient(colors: [
                          Colors.orangeAccent,
                          Colors.orange,
                          Colors.deepOrangeAccent,
                        ])),
                    child: DropdownButton(
                      onChanged: (String? qiymat) {
                        setState(() {
                          til1 = qiymat!;
                        });
                      },
                      items: tillar.map((String til) {
                        return DropdownMenuItem(
                          value: til,
                          child: Text(til),
                        );
                      }).toList(),
                      padding: const EdgeInsets.only(left: 10),
                      underline: Container(),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 25,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      elevation: 15,
                      alignment: Alignment.center,
                      hint: Text(
                        til1,
                        style: const TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      dropdownColor: Colors.orange,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_right_alt_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  // Dropdownbutton - 2
                  Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(10.0, 10.0),
                          color: Colors.black26,
                          blurRadius: 10.0,
                        )
                      ],
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: const LinearGradient(colors: [
                          Colors.orangeAccent,
                          Colors.orange,
                          Colors.deepOrangeAccent,
                        ])),
                    child: DropdownButton(
                      items: tillar.map((String til) {
                        return DropdownMenuItem(
                          value: til,
                          child: Text(til),
                        );
                      }).toList(),
                      padding: const EdgeInsets.only(left: 10),
                      onChanged: (String? qiymat) {
                        setState(() {
                          til2 = qiymat!;
                        });
                      },
                      underline: Container(),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 25,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      elevation: 15,
                      alignment: Alignment.center,
                      hint: Text(til2,
                          style: const TextStyle(fontSize: 22, color: Colors.black)),
                      dropdownColor: Colors.orange,
                      // style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 40,
          ),
          Container(
            // Text kiritish qismi
            constraints: const BoxConstraints(
                minHeight: 200,
                maxHeight: 220,
                minWidth: 330,
                maxWidth: 370
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 27.0,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            // margin: const EdgeInsets.only(bottom: 500),
            child: TextFormField(
              cursorColor: Colors.black,
              maxLines: 15,
              // minLines: 10,
              style: const TextStyle(color: Colors.black, fontSize: 30),
              decoration: const InputDecoration(
                  labelText: "Matn kiriting...",
                  labelStyle: TextStyle(fontSize: 30, color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    // Focus qilinganida chegarani shakllantirish
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                  ),
                  fillColor: Colors.black,
                  enabledBorder: OutlineInputBorder( // default turgan holati
                    borderSide: BorderSide(color: Colors.orange, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  )),
              controller: matnBoshqaruvi,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Tugmalar qismi
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      fixedSize: const Size(75, 50),
                  backgroundColor: Colors.orange,
                   elevation: 15.0),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.mic,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: const Size(180, 60),
                    backgroundColor: Colors.orange,
                    elevation: 15.0,
                    shape: const StadiumBorder()),
                    onPressed: () {
                      tarjimon(tilKodiniOlish(til1), tilKodiniOlish(til2),
                          matnBoshqaruvi.text.toString());
                    },
                    child: const Text(
                      "TARJIMA",
                      style: TextStyle(fontSize: 20.0,
                      color: Colors.white),
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    fixedSize: const Size(70, 50),
                    backgroundColor: Colors.orange,
                    elevation: 15.0,
                  ),
                  child: const Icon(
                    Icons.copy,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          // Natijani chiqarish qismi
          Container(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxHeight: 250,
              minWidth: 340,
              maxWidth: 380
            ),
            // width: 380,
            // height: 250,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 20.0,
              blurStyle: BlurStyle.normal),
            ], borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.orange, width: 1)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: ListView(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                  child: Text(
                    natija,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ])
      ],
    );
  }
}
