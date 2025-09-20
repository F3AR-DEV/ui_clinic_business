// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_route.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRoutes)
const homeRoutesProvider = HomeRoutesProvider._();

final class HomeRoutesProvider
    extends $FunctionalProvider<List<GoRoute>, List<GoRoute>, List<GoRoute>>
    with $Provider<List<GoRoute>> {
  const HomeRoutesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRoutesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRoutesHash();

  @$internal
  @override
  $ProviderElement<List<GoRoute>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<GoRoute> create(Ref ref) {
    return homeRoutes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GoRoute> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GoRoute>>(value),
    );
  }
}

String _$homeRoutesHash() => r'4093edcfc27119542c75b344fcffdbde74bd682e';
