import 'package:flutter/material.dart';
import 'package:news_portal/main.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );

  @override
  void initState() {
    super.initState();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 0,
            stretch: true,
            pinned: true,
            backgroundColor: Colors.white,
            title: Text(
              "Search",
              style: TextStyle(color: black1),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(40), child: TextField()),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  TextFormField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: 'Send a message'),
                  ),
                  StreamBuilder(
                    stream: _channel.stream,
                    builder: (context, snapshot) {
                      return Text(snapshot.hasData ? '${snapshot.data}' : '');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
