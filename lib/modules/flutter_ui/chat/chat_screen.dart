import 'package:firstproject/models/chat_model/chat_model.dart';
import 'package:firstproject/models/story/story_model.dart';
import 'package:flutter/material.dart';


List <StoryModel> storyList =
[
  StoryModel(
      image: 'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg'),
  StoryModel(
      image: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  StoryModel(
      image: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80'),
  StoryModel(
      image: 'https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg'),
  StoryModel(
      image: 'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg'),
  StoryModel(
      image: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  StoryModel(
      image: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80'),
  StoryModel(
      image: 'https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg'),
];

List <ChatModel> chatList =
[
  ChatModel(
      image: 'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg',
      name: 'Abdullah Mahmoud',
      msg: 'Hello how are you i miss u'),
  ChatModel(
      image: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      name: 'Mostafa',
      msg: 'my name is mostafa what is ur name'),
  ChatModel(
      image: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80',
      name: 'Menna',
      msg: 'hello my friend'),
  ChatModel(
      image: 'https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg',
      name: 'Manar',
      msg: 'hello man what is your name'),
  ChatModel(
      image: 'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg',
      name: 'Abdullah Mahmoud',
      msg: 'Hello how are you i miss u'),
  ChatModel(
      image: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      name: 'Mostafa',
      msg: 'my name is mostafa what is ur name'),
  ChatModel(
      image: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80',
      name: 'Menna',
      msg: 'hello my friend'),
  ChatModel(
      image: 'https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg',
      name: 'Manar',
      msg: 'hello man what is your name'),
  ChatModel(
      image: 'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg',
      name: 'Abdullah Mahmoud',
      msg: 'Hello how are you i miss u'),
  ChatModel(
      image: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      name: 'Mostafa',
      msg: 'my name is mostafa what is ur name'),
  ChatModel(
      image: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80',
      name: 'Menna',
      msg: 'hello my friend'),
  ChatModel(
      image: 'https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg',
      name: 'Manar',
      msg: 'hello man what is your name'),
  ChatModel(
      image: 'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg',
      name: 'Abdullah Mahmoud',
      msg: 'Hello how are you i miss u'),
  ChatModel(
      image: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      name: 'Mostafa',
      msg: 'my name is mostafa what is ur name'),
  ChatModel(
      image: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80',
      name: 'Menna',
      msg: 'hello my friend'),
  ChatModel(
      image: 'https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg',
      name: 'Manar',
      msg: 'hello man what is your name'),
  ChatModel(
      image: 'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg',
      name: 'Abdullah Mahmoud',
      msg: 'Hello how are you i miss u'),
  ChatModel(
      image: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      name: 'Mostafa',
      msg: 'my name is mostafa what is ur name'),
  ChatModel(
      image: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80',
      name: 'Menna',
      msg: 'hello my friend'),
  ChatModel(
      image: 'https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg',
      name: 'Manar',
      msg: 'hello man what is your name'),
];

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
              radius: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Chats',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ))),
          const SizedBox(width: 10,),
          CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ))),
          const SizedBox(width: 10,)
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.grey,),
                      SizedBox(width: 10,),
                      Text('Search')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      buildStoryItem(storyList[index]),
                  itemCount: storyList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 10,),
                ),
              )
              , const SizedBox(height: 20,),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(chatList[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 10,),
                itemCount: chatList.length,
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem(StoryModel model) =>
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                model.image),
            radius: 25,
          ),
          const CircleAvatar(
            radius: 9,
            backgroundColor: Colors.white,
          ),
          const CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          )
        ],
      );

  Widget buildChatItem(ChatModel model) =>
      Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                model.image),
            radius: 25,
          ),
          const SizedBox(width: 15,),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.name, maxLines: 1, overflow: TextOverflow.ellipsis,),
                Text(model.msg, maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13),),
              ],
            ),
          ),
          const Spacer(),
          const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 7,
              child: Icon(Icons.check, color: Colors.white, size: 10,))
        ],
      );


// arrow function

// build model
//  retrieve data
// put list in design

//how to make list view
//1- build item
//2- build list view
// 3- add item in list view
}



