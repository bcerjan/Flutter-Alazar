class AlazarResponse {
  const AlazarResponse({
    required this.msg,
    required this.running,
    this.imageData,
  });
  final String msg;
  final bool running;
  final List<int>? imageData;
}
