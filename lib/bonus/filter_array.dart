List<int> filterFromSecondArray(List<int> listA, List<int> listB) {
  List<int> filteredArray = [];

  for (var elementA in listA) {
    bool found = false;
    for (var elementB in listB) {
      if (elementA == elementB) {
        found = true;
        break;
      }
    }
    if (found) {
      filteredArray.add(elementA);
    }
  }

  return filteredArray;
}
