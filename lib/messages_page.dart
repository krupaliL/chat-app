import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Recent',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Container(
            height: 105,
            padding: const EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact('Barry', context),
                _buildRecentContact('Barry', context),
                _buildRecentContact('Barry', context),
                _buildRecentContact('Barry', context),
                _buildRecentContact('Barry', context),
                _buildRecentContact('Barry', context),
              ],
            ),
          ),

          const SizedBox(height: 10,),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: ListView(
                children: [
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                  _buildMessageTile('Alvin', 'alvin@gmail.com', '04:20'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentContact(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://flux-image.com/image/portrait-of-a-young-girl-with-long-black-hair-and-striking-blue-eyes'),
          ),
          const SizedBox(height: 5,),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage('https://www.google.com/imgres?q=profile%20image&imgurl=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fpreviews%2F042%2F332%2F098%2Fnon_2x%2Fdefault-avatar-profile-icon-grey-photo-placeholder-female-no-photo-images-for-unfilled-user-profile-greyscale-illustration-for-socail-media-web-vector.jpg&imgrefurl=https%3A%2F%2Fwww.vecteezy.com%2Fvector-art%2F42332098-default-avatar-profile-icon-grey-photo-placeholder-female-no-photo-images-for-unfilled-user-profile-greyscale-vector-illustration-for-socail-media-web&docid=zi6LmoVDkURQsM&tbnid=B3Ei_Tm3q0K2eM&vet=12ahUKEwi597KdhKeKAxWeSWwGHSQsL48QM3oECH8QAA..i&w=980&h=980&hcb=2&ved=2ahUKEwi597KdhKeKAxWeSWwGHSQsL48QM3oECH8QAA'),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
