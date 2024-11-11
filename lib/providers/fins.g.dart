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

String _$finstsHash() => r'5251a94c909c31c1858ceb1285d9b911a7dc3c57';

/// See also [finsts].
@ProviderFor(finsts)
final finstsProvider =
    AutoDisposeFutureProvider<Either<Failure, FinancesStats>>.internal(
  finsts,
  name: r'finstsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$finstsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FinstsRef
    = AutoDisposeFutureProviderRef<Either<Failure, FinancesStats>>;
String _$finordHash() => r'87c5d4dc4b83b802c417ad511543043d32439465';

/// See also [finord].
@ProviderFor(finord)
const finordProvider = FinordFamily();

/// See also [finord].
class FinordFamily extends Family<AsyncValue<Either<Failure, GraphData>>> {
  /// See also [finord].
  const FinordFamily();

  /// See also [finord].
  FinordProvider call(
    String timeframe,
    String method,
    String status,
  ) {
    return FinordProvider(
      timeframe,
      method,
      status,
    );
  }

  @override
  FinordProvider getProviderOverride(
    covariant FinordProvider provider,
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
  String? get name => r'finordProvider';
}

/// See also [finord].
class FinordProvider
    extends AutoDisposeFutureProvider<Either<Failure, GraphData>> {
  /// See also [finord].
  FinordProvider(
    String timeframe,
    String method,
    String status,
  ) : this._internal(
          (ref) => finord(
            ref as FinordRef,
            timeframe,
            method,
            status,
          ),
          from: finordProvider,
          name: r'finordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$finordHash,
          dependencies: FinordFamily._dependencies,
          allTransitiveDependencies: FinordFamily._allTransitiveDependencies,
          timeframe: timeframe,
          method: method,
          status: status,
        );

  FinordProvider._internal(
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
    FutureOr<Either<Failure, GraphData>> Function(FinordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FinordProvider._internal(
        (ref) => create(ref as FinordRef),
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
  AutoDisposeFutureProviderElement<Either<Failure, GraphData>> createElement() {
    return _FinordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FinordProvider &&
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
mixin FinordRef on AutoDisposeFutureProviderRef<Either<Failure, GraphData>> {
  /// The parameter `timeframe` of this provider.
  String get timeframe;

  /// The parameter `method` of this provider.
  String get method;

  /// The parameter `status` of this provider.
  String get status;
}

class _FinordProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, GraphData>>
    with FinordRef {
  _FinordProviderElement(super.provider);

  @override
  String get timeframe => (origin as FinordProvider).timeframe;
  @override
  String get method => (origin as FinordProvider).method;
  @override
  String get status => (origin as FinordProvider).status;
}

String _$finmonHash() => r'9a4ce33a06697adfea01bc46f79fdf491c06bf47';

/// See also [finmon].
@ProviderFor(finmon)
const finmonProvider = FinmonFamily();

/// See also [finmon].
class FinmonFamily extends Family<AsyncValue<Either<Failure, GraphData>>> {
  /// See also [finmon].
  const FinmonFamily();

  /// See also [finmon].
  FinmonProvider call(
    String timeframe,
    String method,
    String status,
  ) {
    return FinmonProvider(
      timeframe,
      method,
      status,
    );
  }

  @override
  FinmonProvider getProviderOverride(
    covariant FinmonProvider provider,
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
  String? get name => r'finmonProvider';
}

/// See also [finmon].
class FinmonProvider
    extends AutoDisposeFutureProvider<Either<Failure, GraphData>> {
  /// See also [finmon].
  FinmonProvider(
    String timeframe,
    String method,
    String status,
  ) : this._internal(
          (ref) => finmon(
            ref as FinmonRef,
            timeframe,
            method,
            status,
          ),
          from: finmonProvider,
          name: r'finmonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$finmonHash,
          dependencies: FinmonFamily._dependencies,
          allTransitiveDependencies: FinmonFamily._allTransitiveDependencies,
          timeframe: timeframe,
          method: method,
          status: status,
        );

  FinmonProvider._internal(
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
    FutureOr<Either<Failure, GraphData>> Function(FinmonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FinmonProvider._internal(
        (ref) => create(ref as FinmonRef),
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
  AutoDisposeFutureProviderElement<Either<Failure, GraphData>> createElement() {
    return _FinmonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FinmonProvider &&
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
mixin FinmonRef on AutoDisposeFutureProviderRef<Either<Failure, GraphData>> {
  /// The parameter `timeframe` of this provider.
  String get timeframe;

  /// The parameter `method` of this provider.
  String get method;

  /// The parameter `status` of this provider.
  String get status;
}

class _FinmonProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, GraphData>>
    with FinmonRef {
  _FinmonProviderElement(super.provider);

  @override
  String get timeframe => (origin as FinmonProvider).timeframe;
  @override
  String get method => (origin as FinmonProvider).method;
  @override
  String get status => (origin as FinmonProvider).status;
}

String _$finpayHash() => r'492928b5b504e68cebeec34420f6ffa1f4f46f4b';

/// See also [finpay].
@ProviderFor(finpay)
const finpayProvider = FinpayFamily();

/// See also [finpay].
class FinpayFamily extends Family<AsyncValue<Either<Failure, GraphData>>> {
  /// See also [finpay].
  const FinpayFamily();

  /// See also [finpay].
  FinpayProvider call(
    String timeframe,
    String status,
  ) {
    return FinpayProvider(
      timeframe,
      status,
    );
  }

  @override
  FinpayProvider getProviderOverride(
    covariant FinpayProvider provider,
  ) {
    return call(
      provider.timeframe,
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
  String? get name => r'finpayProvider';
}

/// See also [finpay].
class FinpayProvider
    extends AutoDisposeFutureProvider<Either<Failure, GraphData>> {
  /// See also [finpay].
  FinpayProvider(
    String timeframe,
    String status,
  ) : this._internal(
          (ref) => finpay(
            ref as FinpayRef,
            timeframe,
            status,
          ),
          from: finpayProvider,
          name: r'finpayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$finpayHash,
          dependencies: FinpayFamily._dependencies,
          allTransitiveDependencies: FinpayFamily._allTransitiveDependencies,
          timeframe: timeframe,
          status: status,
        );

  FinpayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.timeframe,
    required this.status,
  }) : super.internal();

  final String timeframe;
  final String status;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, GraphData>> Function(FinpayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FinpayProvider._internal(
        (ref) => create(ref as FinpayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        timeframe: timeframe,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, GraphData>> createElement() {
    return _FinpayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FinpayProvider &&
        other.timeframe == timeframe &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeframe.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FinpayRef on AutoDisposeFutureProviderRef<Either<Failure, GraphData>> {
  /// The parameter `timeframe` of this provider.
  String get timeframe;

  /// The parameter `status` of this provider.
  String get status;
}

class _FinpayProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, GraphData>>
    with FinpayRef {
  _FinpayProviderElement(super.provider);

  @override
  String get timeframe => (origin as FinpayProvider).timeframe;
  @override
  String get status => (origin as FinpayProvider).status;
}

String _$finstatusHash() => r'5a5e41eb35f34350a6e4da1f6bdacdef35160ae5';

/// See also [finstatus].
@ProviderFor(finstatus)
final finstatusProvider =
    AutoDisposeFutureProvider<Either<Failure, GraphPie>>.internal(
  finstatus,
  name: r'finstatusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$finstatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FinstatusRef = AutoDisposeFutureProviderRef<Either<Failure, GraphPie>>;
String _$finmethodsHash() => r'577f7f7091364e61143d089b9cc8b8feb92da9f8';

/// See also [finmethods].
@ProviderFor(finmethods)
final finmethodsProvider =
    AutoDisposeFutureProvider<Either<Failure, GraphPie>>.internal(
  finmethods,
  name: r'finmethodsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$finmethodsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FinmethodsRef = AutoDisposeFutureProviderRef<Either<Failure, GraphPie>>;
String _$finstadsHash() => r'6812ee3f4f180db70b1fadde0751230071e6be35';

/// See also [finstads].
@ProviderFor(finstads)
final finstadsProvider =
    AutoDisposeFutureProvider<Either<Failure, FinancesStandings>>.internal(
  finstads,
  name: r'finstadsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$finstadsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FinstadsRef
    = AutoDisposeFutureProviderRef<Either<Failure, FinancesStandings>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
