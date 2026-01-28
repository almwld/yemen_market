class ServiceStats {
  static final Map<String, int> usage = {};

  static void hit(String service) {
    usage[service] = (usage[service] ?? 0) + 1;
  }

  static List<String> sortByUsage(List<String> services) {
    services.sort(
      (a, b) => (usage[b] ?? 0).compareTo(usage[a] ?? 0),
    );
    return services;
  }
}
