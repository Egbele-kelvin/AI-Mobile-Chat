import 'package:chat_gpt/model/chat_model.dart';
import 'package:chat_gpt/widget/user_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

TextEditingController chatcontroller = TextEditingController();
    return Scaffold(
      backgroundColor:const Color(0xff343541),
      appBar: AppBar(
        backgroundColor: const Color(0xff343541),
        title: Text("AI Handy Writer"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Color(0xffd1d5db),
                ),
              ),
        ],
        leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Color(0xffd1d5db),
              ),
            ),
      ),
      body: Consumer<ChatModel>(builder: (context, model, child){
         List<Widget> messages = model.getMessages;
        return  Stack(
          children: [
            Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    child: ListView(
                      children: [
                        const Divider(
                          color: Color(0xffd1d5db),
                        ),
                        for (int i = 0; i < messages.length; i++) messages[i]
                      ],
                    ),
                  ),
                  //input
                  UserInputText(
                    chatTextController: chatcontroller,
                  )
          ],
        );
      }),
    );
  }
}