import 'dart:io';

bool areAnagrams(String str1, String str2) {
  List<String> sortedStr1 = str1.split('')..sort();
  List<String> sortedStr2 = str2.split('')..sort();

  return sortedStr1.join() == sortedStr2.join();
}

void main() {
  var string1 = stdin.readLineSync();
  print("enter the next number");
  var string2 = stdin.readLineSync();
  if (areAnagrams(string1!, string2!)) {
    print('$string1 and $string2 are anagrams.');
  } else {
    print('$string1 and $string2 are not anagrams.');
  }
}
