// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yumemi_weather_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$yumemiWeatherRepositoryHash() =>
    r'b0e721d8af4d64d46cba15358650f1f5abfc4bb1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$YumemiWeatherRepository
    extends BuildlessAutoDisposeNotifier<void> {
  late final YumemiWeather client;

  void build({
    required YumemiWeather client,
  });
}

/// See also [YumemiWeatherRepository].
@ProviderFor(YumemiWeatherRepository)
const yumemiWeatherRepositoryProvider = YumemiWeatherRepositoryFamily();

/// See also [YumemiWeatherRepository].
class YumemiWeatherRepositoryFamily extends Family<void> {
  /// See also [YumemiWeatherRepository].
  const YumemiWeatherRepositoryFamily();

  /// See also [YumemiWeatherRepository].
  YumemiWeatherRepositoryProvider call({
    required YumemiWeather client,
  }) {
    return YumemiWeatherRepositoryProvider(
      client: client,
    );
  }

  @override
  YumemiWeatherRepositoryProvider getProviderOverride(
    covariant YumemiWeatherRepositoryProvider provider,
  ) {
    return call(
      client: provider.client,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'yumemiWeatherRepositoryProvider';
}

/// See also [YumemiWeatherRepository].
class YumemiWeatherRepositoryProvider
    extends AutoDisposeNotifierProviderImpl<YumemiWeatherRepository, void> {
  /// See also [YumemiWeatherRepository].
  YumemiWeatherRepositoryProvider({
    required YumemiWeather client,
  }) : this._internal(
          () => YumemiWeatherRepository()..client = client,
          from: yumemiWeatherRepositoryProvider,
          name: r'yumemiWeatherRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$yumemiWeatherRepositoryHash,
          dependencies: YumemiWeatherRepositoryFamily._dependencies,
          allTransitiveDependencies:
              YumemiWeatherRepositoryFamily._allTransitiveDependencies,
          client: client,
        );

  YumemiWeatherRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.client,
  }) : super.internal();

  final YumemiWeather client;

  @override
  void runNotifierBuild(
    covariant YumemiWeatherRepository notifier,
  ) {
    return notifier.build(
      client: client,
    );
  }

  @override
  Override overrideWith(YumemiWeatherRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: YumemiWeatherRepositoryProvider._internal(
        () => create()..client = client,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        client: client,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<YumemiWeatherRepository, void>
      createElement() {
    return _YumemiWeatherRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YumemiWeatherRepositoryProvider && other.client == client;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, client.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin YumemiWeatherRepositoryRef on AutoDisposeNotifierProviderRef<void> {
  /// The parameter `client` of this provider.
  YumemiWeather get client;
}

class _YumemiWeatherRepositoryProviderElement
    extends AutoDisposeNotifierProviderElement<YumemiWeatherRepository, void>
    with YumemiWeatherRepositoryRef {
  _YumemiWeatherRepositoryProviderElement(super.provider);

  @override
  YumemiWeather get client =>
      (origin as YumemiWeatherRepositoryProvider).client;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
