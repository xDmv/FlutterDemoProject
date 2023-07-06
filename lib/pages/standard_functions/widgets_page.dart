import 'package:example_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({Key? key}) : super(key: key);
  static const path = '/widgets';

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage>
    with TickerProviderStateMixin {
  final _pages = [
    const ButtonsExampleWidget(),
    const InputsExampleWidget(),
  ];
  int _selectedIndex = 0;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).simpleElements),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: S.of(context).buttons,
              ),
              Tab(
                icon: Icon(Icons.format_shapes),
                text: S.of(context).inputs,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onIndexChanged,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: S.of(context).buttons,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_shapes),
              label: S.of(context).inputs,
            ),
          ],
        ),
      ),
    );
  }

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = index;
    });
  }
}

class TitledWidget extends StatelessWidget {
  const TitledWidget({
    required this.name,
    required this.child,
    super.key,
  });

  final String name;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              name,
              textAlign: TextAlign.center,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class ButtonsExampleWidget extends StatefulWidget {
  const ButtonsExampleWidget({super.key});

  @override
  State<ButtonsExampleWidget> createState() => _ButtonsExampleWidgetState();
}

class _ButtonsExampleWidgetState extends State<ButtonsExampleWidget> {
  final toggleValues = <bool>[
    true,
    false,
    false,
  ];

  int? dropDownValue = 1;
  int? dropDownValue1 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.4,
          crossAxisCount: 2,
        ),
        children: <Widget>[
          TitledWidget(
            name: 'Material Button',
            child: MaterialButton(
              onPressed: _showSnackBar,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('BUTTON'),
            ),
          ),
          TitledWidget(
            name: 'Text Button',
            child: TextButton(
              onPressed: _showSnackBar,
              child: const Text('BUTTON'),
            ),
          ),
          TitledWidget(
            name: 'Elevated Button',
            child: ElevatedButton(
              onPressed: _showSnackBar,
              child: const Text('BUTTON'),
            ),
          ),
          TitledWidget(
            name: 'Outlined Button',
            child: OutlinedButton(
              onPressed: _showSnackBar,
              child: const Text('BUTTON'),
            ),
          ),
          TitledWidget(
            name: 'Cupertino Button',
            child: CupertinoButton(
              onPressed: _showSnackBar,
              child: const Text('BUTTON'),
            ),
          ),
          TitledWidget(
            name: 'Icon Button',
            child: IconButton(
              onPressed: _showSnackBar,
              color: Colors.red,
              icon: const Icon(Icons.restaurant_menu),
            ),
          ),
          TitledWidget(
            name: 'Toggle Buttons',
            child: ToggleButtons(
              onPressed: (t) => setState(() {
                toggleValues[t] = !toggleValues[t];
              }),
              isSelected: toggleValues,
              children: const <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.g_translate),
                Icon(Icons.satellite),
              ],
            ),
          ),
          TitledWidget(
            name: 'PopupMenu Buttons',
            child: PopupMenuButton(
              itemBuilder: (_) => [
                const PopupMenuItem(child: Text('One')),
                const PopupMenuItem(child: Text('Two')),
                const PopupMenuItem(child: Text('Three')),
                const PopupMenuItem(child: Text('Four')),
              ],
            ),
          ),
          TitledWidget(
            name: 'Dropdown Buttons',
            child: DropdownButton(
              onChanged: (int? t) => setState(() {
                dropDownValue = t;
              }),
              value: dropDownValue,
              items: const [
                DropdownMenuItem(value: 1, child: Text('Test 1')),
                DropdownMenuItem(value: 2, child: Text('Test 2')),
                DropdownMenuItem(value: 3, child: Text('Test 3')),
                DropdownMenuItem(value: 4, child: Text('Test 4')),
                DropdownMenuItem(value: 5, child: Text('Test 5')),
              ],
            ),
          ),
          TitledWidget(
            name: 'Without Underline Dropdown Buttons',
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: (int? t) => setState(() {
                  dropDownValue1 = t;
                }),
                value: dropDownValue1,
                items: const [
                  DropdownMenuItem(value: 1, child: Text('Test 1')),
                  DropdownMenuItem(value: 2, child: Text('Test 2')),
                  DropdownMenuItem(value: 3, child: Text('Test 3')),
                  DropdownMenuItem(value: 4, child: Text('Test 4')),
                  DropdownMenuItem(value: 5, child: Text('Test 5')),
                ],
              ),
            ),
          ),
          TitledWidget(
            name: 'Floating Action Button',
            child: FloatingActionButton(
              // ignore: no-empty-block
              onPressed: () {},
              heroTag: UniqueKey(),
              key: UniqueKey(),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Action',
          // ignore: no-empty-block
          onPressed: () {},
        ),
        content: const Text('Awesome SnackBar!'),
        duration: const Duration(milliseconds: 1500),
        width: 280,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class InputsExampleWidget extends StatefulWidget {
  const InputsExampleWidget({super.key});

  @override
  State<InputsExampleWidget> createState() => _InputsExampleWidgetState();
}

class _InputsExampleWidgetState extends State<InputsExampleWidget> {
  final _formKey = GlobalKey<FormState>();

  int? _groupValue = 0;
  bool? _checkBoxValue = false;
  RangeValues _ranges = const RangeValues(10, 150);
  RangeLabels _labels = const RangeLabels('Start', 'End');
  double _slideValue = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _formKey.currentState?.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore_for_file: long-method
    final headline5TextStyle = Theme.of(context).textTheme.headline5;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Radio', style: headline5TextStyle),
          ),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    groupValue: _groupValue,
                    value: 0,
                    onChanged: (int? value) => setState(() {
                      _groupValue = value;
                    }),
                  ),
                  const Text('Male'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    groupValue: _groupValue,
                    value: 1,
                    onChanged: (int? value) => setState(() {
                      _groupValue = value;
                    }),
                  ),
                  const Text('Female'),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Checkbox', style: headline5TextStyle),
          ),
          Row(
            children: [
              Checkbox(
                onChanged: (bool? value) => setState(() {
                  _checkBoxValue = value;
                }),
                value: _checkBoxValue,
              ),
              const Text('MEMORY'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Switch', style: headline5TextStyle),
          ),
          Row(
            children: [
              Switch(
                onChanged: (bool? value) => setState(() {
                  _checkBoxValue = value;
                }),
                value: _checkBoxValue ?? false,
              ),
              const Text('multipart'),
              const SizedBox(width: 32),
              CupertinoSwitch(
                onChanged: (bool? value) => setState(() {
                  _checkBoxValue = value;
                }),
                value: _checkBoxValue ?? false,
              ),
              const Text('multipart'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('TextFields', style: headline5TextStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Material'),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                controller: TextEditingController()
                  ..text = 'Text text text text',
                validator: (_) => 'Error',
                decoration: const InputDecoration(
                  hintText: 'with Hint',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: TextEditingController()..text = 'Text text text text',
              decoration: const InputDecoration(
                labelText: 'with Label',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'with Border',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Cupertino'),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const CupertinoTextField(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Range Slider', style: headline5TextStyle),
          ),
          const SizedBox(height: 10),
          RangeSlider(
            onChanged: (RangeValues value) => setState(() {
              _ranges = value;
              _labels = RangeLabels(
                value.start.toString(),
                value.end.toString(),
              );
            }),
            labels: _labels,
            values: _ranges,
            min: 10,
            max: 150,
            divisions: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Slider', style: headline5TextStyle),
          ),
          Slider(
            onChanged: (double value) => setState(() {
              _slideValue = value;
            }),
            value: _slideValue,
            label: '$_slideValue',
            max: 100,
            divisions: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CupertinoSlider(
              value: _slideValue,
              max: 100,
              divisions: 10,
              onChanged: (double value) => setState(() {
                _slideValue = value;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
