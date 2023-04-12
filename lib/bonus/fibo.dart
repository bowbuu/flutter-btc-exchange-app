List<int> generateFibonacciSequence(int n) {
  if (n <= 0) {
    return [];
  } else if (n == 1) {
    return [0];
  } else {
    List<int> sequence = [0, 1];

    for (int i = 2; i < n; i++) {
      sequence.add(sequence[i - 1] + sequence[i - 2]);
    }

    return sequence;
  }
}
