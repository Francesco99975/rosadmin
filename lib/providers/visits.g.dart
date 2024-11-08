// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visits.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$visitsHash() => r'd73b3c72dfc1658c90a459cea7352789a776eb7f';

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

/// See also [visits].
@ProviderFor(visits)
const visitsProvider = VisitsFamily();

/// See also [visits].
class VisitsFamily extends Family<AsyncValue<Either<Failure, Visit>>> {
  /// See also [visits].
  const VisitsFamily();

  /// See also [visits].
  VisitsProvider call(
    String quality,
    String timeframe,
  ) {
    return VisitsProvider(
      quality,
      timeframe,
    );
  }

  @override
  VisitsProvider getProviderOverride(
    covariant VisitsProvider provider,
  ) {
    return call(
      provider.quality,
      provider.timeframe,
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
  String? get name => r'visitsProvider';
}

/// See also [visits].
class VisitsProvider extends AutoDisposeFutureProvider<Either<Failure, Visit>> {
  /// See also [visits].
  VisitsProvider(
    String quality,
    String timeframe,
  ) : this._internal(
          (ref) => visits(
            ref as VisitsRef,
            quality,
            timeframe,
          ),
          from: visitsProvider,
          name: r'visitsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$visitsHash,
          dependencies: VisitsFamily._dependencies,
          allTransitiveDependencies: VisitsFamily._allTransitiveDependencies,
          quality: quality,
          timeframe: timeframe,
        );

  VisitsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quality,
    required this.timeframe,
  }) : super.internal();

  final String quality;
  final String timeframe;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, Visit>> Function(VisitsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VisitsProvider._internal(
        (ref) => create(ref as VisitsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quality: quality,
        timeframe: timeframe,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, Visit>> createElement() {
    return _VisitsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VisitsProvider &&
        other.quality == quality &&
        other.timeframe == timeframe;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quality.hashCode);
    hash = _SystemHash.combine(hash, timeframe.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VisitsRef on AutoDisposeFutureProviderRef<Either<Failure, Visit>> {
  /// The parameter `quality` of this provider.
  String get quality;

  /// The parameter `timeframe` of this provider.
  String get timeframe;
}

class _VisitsProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, Visit>>
    with VisitsRef {
  _VisitsProviderElement(super.provider);

  @override
  String get quality => (origin as VisitsProvider).quality;
  @override
  String get timeframe => (origin as VisitsProvider).timeframe;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
