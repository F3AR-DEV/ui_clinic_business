// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_redirect.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRedirect)
const authRedirectProvider = AuthRedirectFamily._();

final class AuthRedirectProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  const AuthRedirectProvider._({
    required AuthRedirectFamily super.from,
    required (BuildContext, GoRouterState) super.argument,
  }) : super(
         retry: null,
         name: r'authRedirectProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authRedirectHash();

  @override
  String toString() {
    return r'authRedirectProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    final argument = this.argument as (BuildContext, GoRouterState);
    return authRedirect(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthRedirectProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authRedirectHash() => r'6e3b6a47e5ae1de2461e16fb2ca548cdd0356f4d';

final class AuthRedirectFamily extends $Family
    with $FunctionalFamilyOverride<String?, (BuildContext, GoRouterState)> {
  const AuthRedirectFamily._()
    : super(
        retry: null,
        name: r'authRedirectProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthRedirectProvider call(BuildContext context, GoRouterState state) =>
      AuthRedirectProvider._(argument: (context, state), from: this);

  @override
  String toString() => r'authRedirectProvider';
}
