List<int> generatePrimes(int n) {
  List<int> primes = [];

  for (int i = 2; i <= n; i++) {
    bool isPrime = true;

    for (int j = 2; j <= (i / 2).floor(); j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) {
      primes.add(i);
    }
  }

  return primes;
}
