// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clintl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clintlHash() => r'f79d3f8b4fc3be3f8792c57ec16c412261aa2255';

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

/// See also [clintl].
@ProviderFor(clintl)
const clintlProvider = ClintlFamily();

/// See also [clintl].
class ClintlFamily extends Family<AsyncValue<Either<Failure, Clientele>>> {
  /// See also [clintl].
  const ClintlFamily();

  /// See also [clintl].
  ClintlProvider call(
    String timeframe,
  ) {
    return ClintlProvider(
      timeframe,
    );
  }

  @override
  ClintlProvider getProviderOverride(
    covariant ClintlProvider provider,
  ) {
    return call(
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
  String? get name => r'clintlProvider';
}

/// See also [clintl].
class ClintlProvider
    extends AutoDisposeFutureProvider<Either<Failure, Clientele>> {
  /// See also [clintl].
  ClintlProvider(
    String timeframe,
  ) : this._internal(
          (ref) => clintl(
            ref as ClintlRef,
            timeframe,
          ),
          from: clintlProvider,
          name: r'clintlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clintlHash,
          dependencies: ClintlFamily._dependencies,
          allTransitiveDependencies: ClintlFamily._allTransitiveDependencies,
          timeframe: timeframe,
        );

  ClintlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.timeframe,
  }) : super.internal();

  final String timeframe;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, Clientele>> Function(ClintlRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClintlProvider._internal(
        (ref) => create(ref as ClintlRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        timeframe: timeframe,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, Clientele>> createElement() {
    return _ClintlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClintlProvider && other.timeframe == timeframe;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeframe.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ClintlRef on AutoDisposeFutureProviderRef<Either<Failure, Clientele>> {
  /// The parameter `timeframe` of this provider.
  String get timeframe;
}

class _ClintlProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, Clientele>>
    with ClintlRef {
  _ClintlProviderElement(super.provider);

  @override
  String get timeframe => (origin as ClintlProvider).timeframe;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
