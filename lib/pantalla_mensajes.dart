import 'package:auth_and_db_connection/User/model/mensaje.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'User/model/user.dart';

class ScreenArguments {
  final Usuario usuario;
  ScreenArguments(this.usuario);
}

class PantallaMensajes extends StatefulWidget {

  static const routeName = '/mensajes';

  @override
  _PantallaMensajesState createState() => _PantallaMensajesState();
}

class _PantallaMensajesState extends State<PantallaMensajes> {

  _buildMessage(Message message, bool isMe){
    final Container msg = Container(
      margin: isMe
        ? EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 80.0,
          )
        : EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Colors.amberAccent.withAlpha(50) : Color(0xFFFFEFEE),
        borderRadius: isMe
          ? BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0)
            )
          : BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
            icon: message.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            iconSize: 30.0,
            color: message.isLiked
                ? Colors.red
                : Colors.blueGrey,
            onPressed: (){}
        )
      ],
    );
  }

  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: (){},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value){},
              decoration: InputDecoration.collapsed(
                  hintText: 'Send a Message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: (){},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(args.usuario.foto),
            ),
            SizedBox(width: 12.0),
            Column(
              children: <Widget>[
                Text(
                  args.usuario.nombre,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Conectado hace 24 min.',
                  style: TextStyle(
                      fontSize: 10.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal
                  ),
                )
              ],
            ),
          ],
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){},
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top:10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index){
                      final Message message = messages[index];
                      final bool isMe = message.sender.claveInterna == usuarioActual.claveInterna;
                      return _buildMessage(message, isMe);
                    }
                  ),
                ),
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
