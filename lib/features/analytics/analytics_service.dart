class AnalyticsService {
  static void log(String event, {Map<String, dynamic>? data}) {
    // لاحقًا Firebase / Mixpanel / Segment
    print('[ANALYTICS] $event => $data');
  }
}
