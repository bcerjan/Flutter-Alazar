class SampleRateException implements Exception {
  const SampleRateException([this.message = '']);
  final String message;
}

class InvalidNumberOfChannelsException implements Exception {
  const InvalidNumberOfChannelsException([this.message = '']);
  final String message;
}

class TooFewSamplesException implements Exception {
  const TooFewSamplesException([this.message = '']);
  final String message;
}

class BadSamplesPerLineException implements Exception {
  const BadSamplesPerLineException([this.message = '']);
  final String message;
}

class InvalidControlBoxException implements Exception {
  const InvalidControlBoxException([this.message = '']);
  final String message;
}

class InvalidBoardValue implements Exception {
  const InvalidBoardValue([this.message = '']);
  final String message;
}
