// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fins.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$finsHash() => r'fc9938d10b508eaf44b32d86f342a316ef1ed3e9';

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

/// See also [fins].
@ProviderFor(fins)
const finsProvider = FinsFamily();

/// See also [fins].
class FinsFamily extends Family<AsyncValue<Either<Failure, Finances>>> {
  /// See also [fins].
  const FinsFamily();

  /// See also [fins].
  FinsProvider call(
    String timeframe,
    String method,
    String status,
  ) {
    return FinsProvider(
      timeframe,
      method,
      status,
    );
  }

  @override
  FinsProvider getProviderOverride(
    covariant FinsProvider provider,
  ) {
    return call(
      provider.timeframe,
      provider.method,
      provider.status,
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
  String? get name => r'finsProvider';
}

/// See also [fins].
class FinsProvider
    extends AutoDisposeFutureProvider<Either<Failure, Finances>> {
  /// See also [fins].
  FinsProvider(
    String timeframe,
    String method,
    String status,
  ) : this._internal(
          (ref) => fins(
            ref as FinsRef,
            timeframe,
            method,
            status,
          ),
          from: finsProvider,
          name: r'finsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$finsHash,
          dependencies: FinsFamily._dependencies,
          allTransitiveDependencies: FinsFamily._allTransitiveDependencies,
          timeframe: timeframe,
          method: method,
          status: status,
        );

  FinsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.timeframe,
    required this.method,
    required this.status,
  }) : super.internal();

  final String timeframe;
  final String method;
  final String status;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, Finances>> Function(FinsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FinsProvider._internal(
        (ref) => create(ref as FinsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        timeframe: timeframe,
        method: method,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, Finances>> createElement() {
    return _FinsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FinsProvider &&
        other.timeframe == timeframe &&
        other.method == method &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeframe.hashCode);
    hash = _SystemHash.combine(hash, method.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FinsRef on AutoDisposeFutureProviderRef<Either<Failure, Finances>> {
  /// The parameter `timeframe` of this provider.
  String get timeframe;

  /// The parameter `method` of this provider.
  String get method;

  /// The parameter `status` of this provider.
  String get status;
}

class _FinsProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, Finances>>
    with FinsRef {
  _FinsProviderElement(super.provider);

  @override
  String get timeframe => (origin as FinsProvider).timeframe;
  @override
  String get method => (origin as FinsProvider).method;
  @override
  String get status => (origin as FinsProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
