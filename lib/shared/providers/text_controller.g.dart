// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(textController)
const textControllerProvider = TextControllerFamily._();

final class TextControllerProvider
    extends
        $FunctionalProvider<
          TextEditingController,
          TextEditingController,
          TextEditingController
        >
    with $Provider<TextEditingController> {
  const TextControllerProvider._({
    required TextControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'textControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$textControllerHash();

  @override
  String toString() {
    return r'textControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TextEditingController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TextEditingController create(Ref ref) {
    final argument = this.argument as String;
    return textController(ref, fieldKey: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TextControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$textControllerHash() => r'a3f60c7a2bc035d4891404adb0fc0d49903da1f2';

final class TextControllerFamily extends $Family
    with $FunctionalFamilyOverride<TextEditingController, String> {
  const TextControllerFamily._()
    : super(
        retry: null,
        name: r'textControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TextControllerProvider call({required String fieldKey}) =>
      TextControllerProvider._(argument: fieldKey, from: this);

  @override
  String toString() => r'textControllerProvider';
}
