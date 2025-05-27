import 'dart:io';

void main(){

//take five input numbers
stdout.write('Enter your 1st subject marks out of 50 : ');
int sub1 = int.parse(stdin.readLineSync()!);
stdout.write('Enter your 2nd subject marks out of 50 : ');
int sub2 = int.parse(stdin.readLineSync()!);
stdout.write('Enter your 3rd subject marks out of 50 : ');
int sub3 = int.parse(stdin.readLineSync()!);
stdout.write('Enter your 4th subject marks out of 50 : ');
int sub4 = int.parse(stdin.readLineSync()!);
stdout.write('Enter your 5th subject marks out of 50 : ');
int sub5 = int.parse(stdin.readLineSync()!);

//print their percentage
stdout.write(((sub1 + sub2 + sub3 + sub4 + sub5)/250)*100);
}
