import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

/**
   * 
   *  [filterChip accepts multi choices] coding feature
   * [choiceChip accepts single choice] coding feature
   * 
   */

class _SecondPageState extends State<SecondPage> {
  List<String> chips = List.empty(growable: true);
  List<bool> choices = [false, false, false, false];
  TextEditingController chipInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('chips'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: TextFormField(
                    controller: chipInput,
                  ),
                ),
                Container(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      String chipValue = chipInput.text;
                      chipInput.clear();
                      setState(() {
                        chips.add(chipValue);
                      });
                    },
                    child: Text('add'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView.builder(
              itemCount: chips.length,
              itemBuilder: (context, index) => InputChip(
                label: Text(
                  chips[index],
                ),
                onSelected: (bool value) {},
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                ChoiceChip(
                  label: Text('Choice 1'),
                  selected: choices[0],
                  onSelected: (value) {
                    choices.fillRange(0, choices.length, false);

                    setState(() {
                      choices[0] = value;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Choice 2'),
                  selected: choices[1],
                  onSelected: (value) {
                    choices.fillRange(0, choices.length, false);

                    setState(() {
                      choices[1] = value;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Choice 3'),
                  selected: choices[2],
                  onSelected: (value) {
                    choices.fillRange(0, choices.length, false);

                    setState(() {
                      choices[2] = value;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Choice 4'),
                  selected: choices[3],
                  onSelected: (value) {
                    choices.fillRange(0, choices.length, false);

                    setState(() {
                      choices[3] = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
