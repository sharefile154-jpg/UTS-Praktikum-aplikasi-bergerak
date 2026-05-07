import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyPorto"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 232, 224, 225),
     
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text(
                  "Cek Hasil Karyaku Disini",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  MyMenu(
                    title: "Counter",
                    icon: Icons.countertops,
                    color: Colors.red,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterPage(),
                      ),
                    ),
                  ),
                  MyMenu(
                    title: "Widget",
                    icon: Icons.widgets,
                    color: Colors.red,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LayeredWidgetPage(),
                      ),
                    ),
                  ),
                  MyMenu(
                    title: "Input",
                    icon: Icons.woman,
                    color: Colors.red,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserInputPage(),
                      ),
                    ),
                  ),
                  MyMenu(
                    title: "Dynamic",
                    icon: Icons.dynamic_feed,
                    color: Colors.red,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DynamicListPage(),
                      ),
                    ),
                  ),
                  MyMenu(
                    title: "Grid",
                    icon: Icons.grid_on,
                    color: Colors.red,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GridViewPage(),
                      ),
                    ),
                  ),
                  MyMenu(
                    title: "Navigasi",
                    icon: Icons.navigation,
                    color: Colors.red,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationPage(),
                      ),
                    ),
                  ),
                  MyMenu(
                    title: "Tentang Saya",
                    icon: Icons.person,
                    color: Colors.red,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutMePage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- KOMPONEN MENU CARD ---
class MyMenu extends StatelessWidget {
  const MyMenu({super.key, this.title, this.icon, this.color, this.onTap});
  final String? title;
  final IconData? icon;
  final MaterialColor? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        splashColor: const Color.fromARGB(255, 43, 42, 44),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 40.0, color: color),
              const SizedBox(height: 8),
              Text(
                title ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- HALAMAN TENTANG SAYA ---


// --- HALAMAN LAINNYA ---

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 9,
        itemBuilder: (context, index) => Container(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(
            child: Text(
              'Item ${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});
  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  final List<String> _items = [];
  final TextEditingController _controller = TextEditingController();
  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic List'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Add item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addItem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_items[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeItem(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInputPage extends StatefulWidget {
  const UserInputPage({super.key});
  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  final TextEditingController _controller = TextEditingController();
  String _inputText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => _inputText = _controller.text),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text('Input: $_inputText', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter', style: const TextStyle(fontSize: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _counter++),
                  child: const Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => setState(() => _counter--),
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LayeredWidgetPage extends StatelessWidget {
  const LayeredWidgetPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Bertingkat'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: const Color.fromARGB(255, 27, 204, 236),
            ),
            Container(
              width: 150,
              height: 150,
              color: const Color.fromARGB(255, 17, 4, 31),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text('Zibran', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigasi'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
          ),
          child: const Text(
            'Kembali ke Dashboard',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tentang saya'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                backgroundImage: AssetImage("assets/images/zibemz.jpeg"),
              ),
              SizedBox(height: 20),
              Text(
                "Muhammad Zibran Al Rahman ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "20241320060",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Divider(),
              Text(
                "Saya adalah seorang Mahasiswa Sistem Informasi di Universitas Kebangsaan Republik Indonesia. Portofolio ini menampilkan berbagai widget Flutter yang saya buat sebagai bagian dari pembelajaran.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
