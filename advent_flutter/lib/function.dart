import 'dart:io';
import 'dart:math';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'data.dart';

Map<String, int> Rank1 = {
  'High card': 1,
  'One pair': 2,
  'Two pair': 3,
  'Three of a kind': 4,
  'Full house': 5,
  'Four of a kind':6,
  'Five of a kind': 7,
};
Map<String, int> Rank2 = {
  'A': 13,
  'K': 12,
  'Q': 11,
  'J': 10,
  'T': 9,
  '9': 8,
  '8': 7,
  '7': 6,
  '6': 5,
  '5': 4,
  '4': 3,
  '3': 2,
  '2': 1
};

Map<String, int> DataConversion() {
  var split = data.split('\n');
  Map<String, int> info = {};
  for (var i=0; i<split.length; i++){
    var pair = split[i].split(' ');
    info[pair[0]] = int.parse(pair[1]);
  }
  return info;
}
String Sorting2(String hand){
  List<String> Card = hand.split('');
  List<String> CardUnique = Card.toSet().toList();
  List<int> DuplicatesList = [];
  int CardDuplicate = 0;

  for(var i = 0; i<CardUnique.length; i++){
    for(var j=0; j<Card.length; j++){
      if(Card[j] == CardUnique[i]){
        CardDuplicate ++;
      }

    }
    DuplicatesList.add(CardDuplicate);
    CardDuplicate = 0;
  }
  if (DuplicatesList.contains(5)){
    return 'Five of a kind';
  }
  else if (DuplicatesList.contains(4)){
    return 'Four of a kind';
  }
  else if (DuplicatesList.contains(3)){
    if (DuplicatesList.contains(2)){
      return 'Full house';
    }
    else{
      return 'Three of a kind';
    }
  }
  else if (DuplicatesList.contains(2)){
    if (DuplicatesList.contains(3)){
      return 'Full house';
    }
    DuplicatesList.remove(2);
    if(DuplicatesList.contains(2)){
      return 'Two pair';
  }
    else{
      return 'One pair';
    }
  }
  else{
    return 'High card';
  }
}
String Sorting(String hand) {
  List<String> Card = hand.split('');
  List<String> CardUnique = Card.toSet().toList();
  List<int> DuplicatesList = [];
  String CurrentCard = '';
  int NumberDuplicates = 0;
  int numberOfCardSimilar = Card.length - CardUnique.length;
  if(numberOfCardSimilar == 0 ){
    return 'High card';
  }
  else if (numberOfCardSimilar ==1){
    return 'One pair';
  }
  else if (numberOfCardSimilar ==2){
    for (var i = 0; i<CardUnique.length; i++){

      if(NumberDuplicates ==1){
        NumberDuplicates = 0;
      }
      else if (NumberDuplicates == 2){
        return 'Two pair';
      }
      else if (NumberDuplicates ==3){

        /*for (var k = 0; k<Card.length; k++){
          List<int> removeIndex = [];
          for (var k=0; k<Card.length; k++){
            if (Card[k] == CurrentCard){
              removeIndex.add(k);
            }
          }
          for (var h = removeIndex.length-1; h>-1; h--) {
            Card.removeAt(h);
          }
          if (Card[0] == Card[1]){
            return 'Full house';
          }
          else{
            return 'Three of a kind';
          }
        }*/
        return 'Three of a kind';

      }
      for (var j =0; j<Card.length; j++){
        if (Card[j] == CardUnique[i]){
          NumberDuplicates ++;
          print('duplicates: $NumberDuplicates');
        }
      }

    }

  }
  else if (numberOfCardSimilar ==3){

    for (var i = 0; i<CardUnique.length; i++){

      if(NumberDuplicates ==1){
        NumberDuplicates = 0;
      }
      else if (NumberDuplicates == 2){
        return 'Two pair';
      }
      else if (NumberDuplicates ==3){

        /*for (var k = 0; k<Card.length; k++){
          List<int> removeIndex = [];
          for (var k=0; k<Card.length; k++){
            if (Card[k] == CurrentCard){
              removeIndex.add(k);
            }
          }
          for (var h = removeIndex.length-1; h>-1; h--) {
            Card.removeAt(h);
          }
          if (Card[0] == Card[1]){
            return 'Full house';
          }
          else{
            return 'Three of a kind';
          }
        }*/
        return 'Three of a kind';

      }
      for (var j =0; j<Card.length; j++){
        if (Card[j] == CardUnique[i]){
          NumberDuplicates ++;
          print('duplicates: $NumberDuplicates');
        }
      }

    }
  }
  else if(hand == ''){
    return 'empty hand';
  }

  return 'Error';

}

Map<String, List<String>> Round1(List<String> HandList) {

  List<String> ListRank1 =[];
  List<String>  ListRank2 =[];
  List<String>  ListRank3=[];
  List<String>  ListRank4=[];
  List<String>  ListRank5=[];
  List<String>  ListRank6=[];
  List<String>  ListRank7=[];

  for (var hand in HandList){
    if(Rank1[Sorting2(hand)]==1){
      ListRank1.add(hand);
    }
    else if(Rank1[Sorting2(hand)]==2){
      ListRank2.add(hand);
    }
    else if(Rank1[Sorting2(hand)]==3){
      ListRank3.add(hand);
    }
    else if(Rank1[Sorting2(hand)]==4){
      ListRank4.add(hand);
    }

    else if(Rank1[Sorting2(hand)]==5){
      ListRank5.add(hand);
    }

    else if(Rank1[Sorting2(hand)]==6){
      ListRank6.add(hand);
    }

    else if(Rank1[Sorting2(hand)]==7){
      ListRank7.add(hand);
    }

    }

  return {
    'ListRank1': ListRank1,
    'ListRank2': ListRank2,
    'ListRank3': ListRank3,
    'ListRank4': ListRank4,
    'ListRank5': ListRank5,
    'ListRank6': ListRank6,
    'ListRank7': ListRank7,
  };
}

Map<String, int> Round1Count(List<String> HandList) {

  List<String> ListRank1 =[];
  List<String>  ListRank2 =[];
  List<String>  ListRank3=[];
  List<String>  ListRank4=[];
  List<String>  ListRank5=[];
  List<String>  ListRank6=[];
  List<String>  ListRank7=[];
  for (var hand in HandList){
    if(Rank1[Sorting2(hand)]==1){
      ListRank1.add(hand);
    }
    else if(Rank1[Sorting2(hand)]==2){
      ListRank2.add(hand);
    }
    else if(Rank1[Sorting2(hand)]==3){
      ListRank3.add(hand);
    }
    else if(Rank1[Sorting2(hand)]==4){
      ListRank4.add(hand);
    }

    else if(Rank1[Sorting2(hand)]==5){
      ListRank5.add(hand);
    }

    else if(Rank1[Sorting2(hand)]==6){
      ListRank6.add(hand);
    }

    else if(Rank1[Sorting2(hand)]==7){
      ListRank7.add(hand);
    }

  }

  return {
    'ListRank1': ListRank1.length,
    'ListRank2': ListRank2.length,
    'ListRank3': ListRank3.length,
    'ListRank4': ListRank4.length,
    'ListRank5': ListRank5.length,
    'ListRank6': ListRank6.length,
    'ListRank7': ListRank7.length,
  };
}

List<String> Round2(List<String> HandList){
  List<int> HandListNumerical = [];
  List< String > HandListSorted = [];
  Map<int, String> handToNumber = {};
  //convert string to numerical value & put in a map
  for (var hand in HandList){
    num number = Rank2[hand[0]]!*pow(10,4) + Rank2[hand[1]]!*pow(10,3) + Rank2[hand[2]]!*pow(10,2) + Rank2[hand[3]]!*pow(10,1) + Rank2[hand[4]]!;
    handToNumber[number.toInt()] = hand;
    HandListNumerical.add(number.toInt());
  }
  //sort numerical
  HandListNumerical.sort();
  for (var i = HandListNumerical.length-1; i>-1; i--){
    HandListSorted.add(handToNumber[HandListNumerical[i]]!);
  }
  return HandListSorted;
  //result: list of hands from high to low


}

List<String> RoundCombined(Map<String, List<String>> Round1Done){
  List<String> FinalList = Round2(Round1Done['ListRank7']!) + Round2(Round1Done['ListRank6']!) +
      Round2(Round1Done['ListRank5']!) + Round2(Round1Done['ListRank4']!) + Round2(Round1Done['ListRank3']!) +
      Round2(Round1Done['ListRank2']!) + Round2(Round1Done['ListRank1']!);
  return FinalList;
}


int TotalMoney(List<String> RoundCombined, Map<String, int> HandandBid){
  int total = 0;
  for (var i = 0; i<RoundCombined.length; i++){
    String hand = RoundCombined[i];
    int? money = HandandBid[hand];
    int rank = RoundCombined.length - i;
    total = total + money!*rank;
  }
  return total;
}

List<List<String>> TotalMoneyTest(List<String> RoundCombined, Map<String, int> HandandBid){
  List<List<String>> ComprehensiveList = [];
  for (var i = 0; i<RoundCombined.length; i++){
    String hand = RoundCombined[i];
    int? money = HandandBid[hand];
    int rank = RoundCombined.length - i;
    List<String> handInfo = [hand, rank.toString(), money.toString()];
    ComprehensiveList.add(handInfo);
  }
  return ComprehensiveList;
}

int EntireProcess (){
  List<String> HandList = DataConversion().keys.toList();
  Map<String, List<String>> Round1Result = Round1(HandList);
  return TotalMoney(RoundCombined(Round1Result), DataConversion());
}

List<List<String>> EntireProcessTest (){
  List<String> HandList = DataConversion().keys.toList();
  Map<String, List<String>> Round1Result = Round1(HandList);
  return TotalMoneyTest(RoundCombined(Round1Result), DataConversion());
}