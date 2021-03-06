/*This is a function which returns the greatest element in a list of numbers */
num findGreatestElement(List<num> list){
  num greatestElement = list[0];
  for (num element in list){
    if (element>greatestElement) {
      greatestElement = element;
    }
  }
  return greatestElement;
}
/* and this is a shorter version */
import 'dart:math';
num findGreatestElement(List<num> list){
  return list.reduce(max);
}
