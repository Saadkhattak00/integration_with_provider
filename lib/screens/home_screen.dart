import 'dart:math';

import 'package:flutter/material.dart';
import 'package:integration_with_loc/models/welcome_model.dart';
import 'package:integration_with_loc/providers/welcome_provider.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {


  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  void initState(){
    final provider = Provider.of<welcomeProvider>(context, listen: false);
    provider.getDataFromAPI();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<welcomeProvider>(context);
    print(provider.error);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API Call'),
        centerTitle: true,
      ),
      body: provider.isLoading ? 
      getLoadingUI() : provider.error.isNotEmpty ? 
      getErrorUI(provider.error) :
      getBodyUI(provider.welcome),
    );
  }

  getLoadingUI() {
    return const Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          Text("Loading...")
        ],
      ),
    );
  }

  getErrorUI(String error) {
    return Center(
      child: Text(error),
    );
  }

  getBodyUI(Welcome welcome) {
    return ListView.builder(
      reverse: true,
        itemBuilder: (context, index) => ListTile(
      title: Text(welcome.entries[index].link),
      subtitle: Text(welcome.entries[index].description),
    ));
  }
}
