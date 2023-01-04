import 'package:chat_gpt/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInputText extends StatelessWidget {

 final TextEditingController chatTextController;
 const UserInputText({super.key, required this.chatTextController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 30,
          left: 5,
          right: 5,
        ),
        decoration: const BoxDecoration(
          color: Color(0xff444654),
          border: Border(
            top: BorderSide(
              color: Color(0xffd1d5db),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/grass.jpeg"),
                
              ),
              ),
             const SizedBox(width: 8,),
              Expanded(
                flex: 5,
                child: TextFormField(
                  onFieldSubmitted: (e) {
                  context.read<ChatModel>().sendChat(e);
                   chatTextController.clear();
                  },
                  
                 controller: chatTextController,
                  style: const TextStyle(
                  color: Colors.white,
                ),
                decoration:  InputDecoration(
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: const Color(0xff343541),
                  suffixIcon: IconButton(
                    onPressed: (){
                       context.read<ChatModel>().sendChat(chatTextController.text);
                   chatTextController.clear();
                    }, 
                    icon: const Icon(
                    Icons.send,
                    color: Color(0xffacacbe),
                  )),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                ),
                ),
                 const SizedBox(width: 8,),
          ],
        ),
      ),
    );
  }
}