// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singleOrderHash() => r'28dafe567ddf2bfbc728f9fd79b7de8b807a50e2';

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

abstract class _$SingleOrder
    extends BuildlessAutoDisposeAsyncNotifier<Either<Failure, model.Order>> {
  late final String id;

  FutureOr<Either<Failure, model.Order>> build(
    String id,
  );
}

/// See also [SingleOrder].
@ProviderFor(SingleOrder)
const singleOrderProvider = SingleOrderFamily();

/// See also [SingleOrder].
class SingleOrderFamily
    extends Family<AsyncValue<Either<Failure, model.Order>>> {
  /// See also [SingleOrder].
  const SingleOrderFamily();

  /// See also [SingleOrder].
  SingleOrderProvider call(
    String id,
  ) {
    return SingleOrderProvider(
      id,
    );
  }

  @override
  SingleOrderProvider getProviderOverride(
    covariant SingleOrderProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'singleOrderProvider';
}

/// See also [SingleOrder].
class SingleOrderProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SingleOrder, Either<Failure, model.Order>> {
  /// See also [SingleOrder].
  SingleOrderProvider(
    String id,
  ) : this._internal(
          () => SingleOrder()..id = id,
          from: singleOrderProvider,
          name: r'singleOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleOrderHash,
          dependencies: SingleOrderFamily._dependencies,
          allTransitiveDependencies:
              SingleOrderFamily._allTransitiveDependencies,
          id: id,
        );

  SingleOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<Either<Failure, model.Order>> runNotifierBuild(
    covariant SingleOrder notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(SingleOrder Function() create) {
    return ProviderOverride(
      origin: this,
      override: SingleOrderProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SingleOrder,
      Either<Failure, model.Order>> createElement() {
    return _SingleOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleOrderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SingleOrderRef
    on AutoDisposeAsyncNotifierProviderRef<Either<Failure, model.Order>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SingleOrderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SingleOrder,
        Either<Failure, model.Order>> with SingleOrderRef {
  _SingleOrderProviderElement(super.provider);

  @override
  String get id => (origin as SingleOrderProvider).id;
}

String _$ordersHash() => r'd0448c5cad3ff0df4728ea5f03fbfe644895f09e';

/// See also [Orders].
@ProviderFor(Orders)
final ordersProvider = AutoDisposeAsyncNotifierProvider<Orders,
    Either<Failure, List<model.Order>>>.internal(
  Orders.new,
  name: r'ordersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ordersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Orders = AutoDisposeAsyncNotifier<Either<Failure, List<model.Order>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
