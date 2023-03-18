class ProviderA {
  ProviderA({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });
  late final String logoPath;
  late final int providerId;
  late final String providerName;
  late final int displayPriority;

  ProviderA.fromJson(Map<String, dynamic> json){
    logoPath = json['logo_path'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    displayPriority = json['display_priority'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['logo_path'] = logoPath;
    data['provider_id'] = providerId;
    data['provider_name'] = providerName;
    data['display_priority'] = displayPriority;
    return data;
  }
}
class ProviderB {
  ProviderB({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });
  late final String logoPath;
  late final int providerId;
  late final String providerName;
  late final int displayPriority;

  ProviderB.fromJson(Map<String, dynamic> json){
    logoPath = json['logo_path'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    displayPriority = json['display_priority'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['logo_path'] = logoPath;
    data['provider_id'] = providerId;
    data['provider_name'] = providerName;
    data['display_priority'] = displayPriority;
    return data;
  }
}

class ProviderC {
  ProviderC({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });
  late final String logoPath;
  late final int providerId;
  late final String providerName;
  late final int displayPriority;

  ProviderC.fromJson(Map<String, dynamic> json){
    logoPath = json['logo_path'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    displayPriority = json['display_priority'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['logo_path'] = logoPath;
    data['provider_id'] = providerId;
    data['provider_name'] = providerName;
    data['display_priority'] = displayPriority;
    return data;
  }
}
