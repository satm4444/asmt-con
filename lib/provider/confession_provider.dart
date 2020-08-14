import 'package:confession/model/comment.dart';
import 'package:confession/model/confession.dart';
import 'package:flutter/cupertino.dart';

class ConfessionProvider extends ChangeNotifier {
  List<Confession> _confession = [
    Confession(
        id: "1",
        sem: "6th",
        faculty: "BIM",
        description:
            "Umm this all started one year ago I was in a relation with a guy umm it was all good at first first but after sometime I don't know he changed or it was only my thought he used to talk less just used to find excuses not to meet me used to ignore me ah it was ok for me coz he used to work so maybe he used to be busy so I didn't say anything and he used to talk to his ex and that was also ok for me coz he was with me then day by day he used to loose interest in me and I used to think about only him but he don't then also I didn't share what I was feeling and as day passes my ex sent me friend request I was in dilemma what to do then I think of accepting his request and I did also and my ex started to talk to me but I used to ignore him and  used to reply rarely coz I was in a relation and my ex used to talk to me everday from morning to night then I also used to talk to him coz I usually don't talk to anyone umm and I used to share all these things with my bf coz i wanted to be loyal with him so i didnt hide anything at first he didn't had a problem with it but by the day passes my bf told me not to talk to my ex he is your past so let him be in your past he said I was like what seriously I haven't said anything when he used to talk to his ex and saying me not to talk to my ex and that wasn't fair to me at first after sometime I thought I know no one likes when their gf/bf talk to their exes so I think not to talk to my ex and I did also but again he used to ignore me not to meet me this time more than before I used to call him every morning and night just to make him feel how speical he is for me but never used to recieve my call and I was really feeling bad this time also I didn't say anything again I started to talk to my ex but I used to talk with him as friend and I had no feelings for him and after sometime my bf said I want to break our relation I didn't believe it at first why he want to break our relation all of a sudden?? It really make me feel I'm not worth it I tried to convince him so much but he wasn't about to convinced so I thought it's better to break our relation if he don't want then for my self respect I did and we finally broke up and I didn't say anyone how I felt😭😭😭 I wanted to cry so much but I couldn't and I didn't also coz never cry for someone who don't know your value and I shared all this to my ex he said he felt sorry for me but I didn't care I showed everyone nothing has happen I'm happy without him also but inside I was dying and I didn't tell my ex reason behind my break up as day passes my ex and I used to talk so much everyday from morning to night it was our daily routin he used to share his all feelings everything with me but I didn't used to share my things with him and he was applying for aboard and asked me to join him but I refuse it everytime coz I didn't wanted and all the things were going good days were passing my ex and I used to talk everyday but I don't know how I started to fall for him😔 I started worried when",
        comment: [
          Comment(
              userName: "ABC",
              userComment: "jkaghkfaldflkasdfjhds",
              userProfile:
                  "https://th.bing.com/th/id/OIP.z0IFJ66ziBiZ8vo-a3zYsAHaE8?pid=Api&rs=1"),
        ]),
    Confession(
        id: "2",
        sem: "4th",
        faculty: "BIM",
        description:
            "Umm this all started one year ago I was in a relation with a guy umm it was all good at first first but after sometime I don't know he changed or it was only my thought he used to talk less just used to find excuses not to meet me used to ignore me ah it was ok for me coz he used to work so maybe he used to be busy so I didn't say anything and he used to talk to his ex and that was also ok for me coz he was with me then day by day he used to loose interest in me and I used to think about only him but he don't then also I didn't share what I was feeling and as day passes my ex sent me friend request I was in dilemma what to do then I think of accepting his request and I did also and my ex started to talk to me but I used to ignore him and  used to reply rarely coz I was in a relation and my ex used to talk to me everday from morning to night then I also used to talk to him coz I usually don't talk to anyone umm and I used to share all these things with my bf coz i wanted to be loyal with him so i didnt hide anything at first he didn't had a problem with it but by the day passes my bf told me not to talk to my ex he is your past so let him be in your past he said I was like what seriously I haven't said anything when he used to talk to his ex and saying me not to talk to my ex and that wasn't fair to me at first after sometime I thought I know no one likes when their gf/bf talk to their exes so I think not to talk to my ex and I did also but again he used to ignore me not to meet me this time more than before I used to call him every morning and night just to make him feel how speical he is for me but never used to recieve my call and I was really feeling bad this time also I didn't say anything again I started to talk to my ex but I used to talk with him as friend and I had no feelings for him and after sometime my bf said I want to break our relation I didn't believe it at first why he want to break our relation all of a sudden?? It really make me feel I'm not worth it I tried to convince him so much but he wasn't about to convinced so I thought it's better to break our relation if he don't want then for my self respect I did and we finally broke up and I didn't say anyone how I felt😭😭😭 I wanted to cry so much but I couldn't and I didn't also coz never cry for someone who don't know your value and I shared all this to my ex he said he felt sorry for me but I didn't care I showed everyone nothing has happen I'm happy without him also but inside I was dying and I didn't tell my ex reason behind my break up as day passes my ex and I used to talk so much everyday from morning to night it was our daily routin he used to share his all feelings everything with me but I didn't used to share my things with him and he was applying for aboard and asked me to join him but I refuse it everytime coz I didn't wanted and all the things were going good days were passing my ex and I used to talk everyday but I don't know how I started to fall for him😔 I started worried when"),
    Confession(
        id: "3",
        sem: "6th",
        faculty: "BIM",
        description:
            "his all feelings everything with me but I didn't used to share my things with him and he was applying for aboard and asked me to join him but I refuse it everytime coz I didn't wanted and all the things were going good days were passing my ex and I used to talk everyday but I don't know how I started to fall for him😔 I started worried when"),
  ];

  List<Confession> get confession {
    return [..._confession];
  }

  Confession findById(String id) {
    return _confession.firstWhere((confess) => confess.id == id);
  }

  void addComment(String id, Comment comment) {
    print(id);
    print(comment.userComment);
    print(comment.userName);
    print(comment.userProfile);
    _confession.firstWhere((confess) => confess.id == id).comment.add(comment);
    notifyListeners();
  }

  void addConfession(Confession confession) {
    final newConfession = Confession(
        id: DateTime.now().toIso8601String(),
        sem: confession.sem,
        faculty: confession.faculty,
        gender: confession.gender,
        description: confession.description);
    _confession.add(newConfession);
    notifyListeners();
  }
}
