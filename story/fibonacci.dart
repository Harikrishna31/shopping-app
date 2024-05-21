// void main(){

//   for (int i = 0; i < 10; i++) {
//     print(fibonacci(i));
//   }
// }

// int fibonacci(int n) {

//   if (n == 0 || n == 1) {
//     return n;
//   }

//   return fibonacci(n - 1) + fibonacci(n - 2);
// }
import 'dart:io';

void main() {
  List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

  int i = 0;
  List<int> l = [];

  for (var e in a) {
    if (++i % 2 == 0) {
      l.add(e);
    }
  }
  print(l);
  
 
  print([for (var e in a) if (++i % 2 == 0) e]);
}