// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// 
  internal static let mainView = L10n.tr("Localizable", "// Main View", fallback: #""#)
  /// c
  internal static let a = L10n.tr("Localizable", "a", fallback: #"c"#)
  /// See all…
  internal static let previousValuesSeeHistoryButton = L10n.tr("Localizable", "previous_values_see_history_button", fallback: #"See all…"#)
  /// Previous values:
  internal static let previousValuesTitle = L10n.tr("Localizable", "previous_values_title", fallback: #"Previous values:"#)
  /// Clear
  internal static let resetValuesButton = L10n.tr("Localizable", "reset_values_button", fallback: #"Clear"#)
  /// No
  internal static let resetValuesConfirmationCancelAction = L10n.tr("Localizable", "reset_values_confirmation_cancel_action", fallback: #"No"#)
  /// Yes
  internal static let resetValuesConfirmationConfirmAction = L10n.tr("Localizable", "reset_values_confirmation_confirm_action", fallback: #"Yes"#)
  /// Are you sure?
  internal static let resetValuesConfirmationTitle = L10n.tr("Localizable", "reset_values_confirmation_title", fallback: #"Are you sure?"#)
  internal enum MainView {
    /// Next letter
    internal static let generateValueButton = L10n.tr("Localizable", "main_view.generate_value_button", fallback: #"Next letter"#)
    /// Settings
    internal static let settingsButton = L10n.tr("Localizable", "main_view.settings_button", fallback: #"Settings"#)
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
