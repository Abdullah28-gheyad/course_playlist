import 'package:firstproject/layout/todo_app/cubit/cubit.dart';
import 'package:firstproject/modules/news/web_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget customButton({
  Color color = Colors.blue,
  double width = double.infinity,
  @required Function function,
  @required String text,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));

Widget customTextFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function validate,
  @required String label,
  @required IconData prfixIcon,
  bool isSecure = false,
  IconData suffixIcon,
  Function suffixPress,
  Function onTap,
  Function onChanged,
}) =>
    TextFormField(
      onChanged: onChanged ,
      controller: controller,
      obscureText: isSecure,
      keyboardType: type,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
          label: Text(label),
          prefixIcon: Icon(prfixIcon),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: suffixPress,
          ),
          border: OutlineInputBorder()),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        TodoCubit cubit = BlocProvider.of(context);
        cubit.deleteDataBase(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(model['time']),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(model['title']),
                  Text(model['date']),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  TodoCubit cubit = BlocProvider.of(context);

                  cubit.updateDataBase(status: 'done', id: model['id']);
                },
                icon: Icon(
                  Icons.check_box_outlined,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  TodoCubit cubit = BlocProvider.of(context);

                  cubit.updateDataBase(status: 'archive', id: model['id']);
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );

void navigateTo(context , widget)
{
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>widget ,));
}


void navigateToAndRemove(context , widget)
{
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>widget ,));
}

Widget buildArticleItem(Map model,context) => InkWell(
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WebViewScreen(url: model['url'],)),
    );  },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
            height: 150,
            child: Row(
              children: [
                model['urlToImage'] != null
                    ? Image(
                        image: NetworkImage(model['urlToImage']),
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: NetworkImage(
                            'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg'),
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      model['title'],
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                    )),
                    Text(
                      model['publishedAt'],
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );

Widget buildArticleList(list) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index],context),
    separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          height: 1,
        ),
    itemCount: list.length);
