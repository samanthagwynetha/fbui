import 'friend.dart';
import 'comment.dart';
import 'userpost.dart';
import 'account.dart';

class UserData{
  List<UserPost> userList = [
    UserPost(
      userimg: 'images/user1.jpg', 
      username: 'meongoe', 
      time: 'September 26', 
      postcontent: 'cat white, white cat', 
      postimg: 'images/img1.jpg', 
      numcomments: '7 comments', 
      numshare: '1 shares',
      isLiked: false,
      ),

    UserPost(
      userimg: 'images/user1.jpg', 
      username: 'meongoe', 
      time: 'August 26', 
      postcontent: 'i like to sleep like this', 
      postimg: 'images/img2.jpg', 
      numcomments: '5 comments', 
      numshare: '2 shares',
      isLiked: false,
      ),

    UserPost(
      userimg: 'images/user1.jpg', 
      username: 'meongoe', 
      time: 'July 5', 
      postcontent: 'gf dream house', 
      postimg: 'images/img3.jpg', 
      numcomments: '8 comments', 
      numshare: '1 shares',
      isLiked: false,
      ), 
  ];


  //FRIEND
  List<Friend> friendList = [
    Friend(
      img: 'images/user2.jpg', 
      name: 'moov',
    ),
    Friend(
      img: 'images/user3.jpg', 
      name: 'nich',
    ),
    Friend(
      img: 'images/user4.jpg', 
      name: 'wastua',
    ),
    Friend(
      img: 'images/user5.jpg', 
      name: 'chocho',
    ),
    Friend(
      img: 'images/user6.jpg', 
      name: 'timmy',
    ),
    Friend(
      img: 'images/user7.jpg', 
      name: 'mojo',
    ),
  ];

  //COMMENTS
  List<UserComment> commentList = [
    UserComment(
      commenterImg: 'images/user2.jpg', 
      commenterName: 'moov', 
      commentTime: '3w', 
      commentContent: 'pspspspspsp'
    ),
    UserComment(
      commenterImg: 'images/user3.jpg', 
      commenterName: 'nich', 
      commentTime: '5w', 
      commentContent: 'yummy siopao'
    ),
    UserComment(
      commenterImg: 'images/user5.jpg', 
      commenterName: 'chocho', 
      commentTime: '7w', 
      commentContent: 'gib me dat cat!'
    ),
  ];

  //USERACCOUNT
  Account myUserAccount = Account(
    name: 'meongoe',
    email: 'meongoe@gmail.com',
    img: 'images/user1.jpg',
    numFollowers: '124',
    numPosts: '3',
    numFollowing: '232',
    numFriends: '728'
  );
}
