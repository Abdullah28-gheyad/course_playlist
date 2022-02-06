import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            elevation: 20,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage(
                      'https://image.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=740'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Communicate With Friends',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Abdullah Mahmoud',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 8,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Sunday , February 6,2022',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            size: 15,
                          ))
                    ],
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                      image: NetworkImage(
                    'https://image.freepik.com/free-photo/positive-young-handsome-man-giggles-positively-laughs-something-funny-looks-with-excited-joyful-expression-dressed-casually-isolated-white-background-blank-copy-space-your-advert_273609-56823.jpg?w=740',
                  ) , width: double.infinity,
                  fit: BoxFit.fill,
                  height: 200,),
                  SizedBox(height: 5,) ,
                  Row(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border , color: Colors.red,)) ,
                            SizedBox(width: 5,) ,
                            Text('100') ,
                          ],
                        ),
                      ),
                      Spacer() ,
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.comment , color: Colors.green,)) ,
                            SizedBox(width: 5,) ,
                            Text('50') ,
                          ],
                        ),
                      )
                    ],
                  ) ,
                  SizedBox(height: 5,) ,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                            'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740'),
                      ),
                      SizedBox(width: 20,) ,
                      Text('write a comment' , style: TextStyle(color: Colors.grey , fontSize: 14),) ,
                      Spacer() ,
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border , color: Colors.red,)) ,

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
