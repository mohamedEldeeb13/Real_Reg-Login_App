// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum AppStrings {
  internal enum Login {
    /// Use the same method that you created your account with.
    internal static let subtitle = AppStrings.tr("Localizable", "Login.subtitle", fallback: "Use the same method that you created your account with.")
    /// Login
    internal static let title = AppStrings.tr("Localizable", "Login.title", fallback: "Login")
    internal enum Button {
      /// Forgot Password?
      internal static let forgorPassword = AppStrings.tr("Localizable", "Login.button.forgorPassword", fallback: "Forgot Password?")
      /// Login
      internal static let login = AppStrings.tr("Localizable", "Login.button.login", fallback: "Login")
    }
    internal enum Text {
      /// Don’t have an account?
      internal static let signup = AppStrings.tr("Localizable", "Login.text.signup", fallback: "Don’t have an account?")
    }
    internal enum Textfield {
      /// Email
      internal static let email = AppStrings.tr("Localizable", "Login.textfield.email", fallback: "Email")
      /// Password
      internal static let password = AppStrings.tr("Localizable", "Login.textfield.password", fallback: "Password")
    }
  }
  internal enum Signup {
    /// Localizable.strings
    ///   Real_Reg&Login_App
    /// 
    ///   Created by Mohamed Abd Elhakam on 06/03/2024.
    internal static let title = AppStrings.tr("Localizable", "Signup.title", fallback: "Sign Up")
    internal enum Button {
      /// Continue with Apple
      internal static let apple = AppStrings.tr("Localizable", "Signup.button.apple", fallback: "Continue with Apple")
      /// Sign In with Email
      internal static let email = AppStrings.tr("Localizable", "Signup.button.email", fallback: "Sign In with Email")
      /// Continue with Google
      internal static let google = AppStrings.tr("Localizable", "Signup.button.google", fallback: "Continue with Google")
      /// Sign In
      internal static let signin = AppStrings.tr("Localizable", "Signup.button.signin", fallback: "Sign In")
      /// Sign UP
      internal static let signup = AppStrings.tr("Localizable", "Signup.button.signup", fallback: "Sign UP")
    }
    internal enum Image {
      /// Your reset begins here. 
      internal static let text = AppStrings.tr("Localizable", "Signup.image.text", fallback: "Your reset begins here. ")
    }
    internal enum Text {
      /// Not a member?
      internal static let notmember = AppStrings.tr("Localizable", "Signup.text.notmember", fallback: "Not a member?")
      /// Already have an account
      internal static let signin = AppStrings.tr("Localizable", "Signup.text.signin", fallback: "Already have an account")
    }
    internal enum Textfield {
      /// Email
      internal static let email = AppStrings.tr("Localizable", "Signup.textfield.email", fallback: "Email")
      /// Name
      internal static let name = AppStrings.tr("Localizable", "Signup.textfield.name", fallback: "Name")
      /// Password
      internal static let password = AppStrings.tr("Localizable", "Signup.textfield.password", fallback: "Password")
      /// Phone
      internal static let phone = AppStrings.tr("Localizable", "Signup.textfield.phone", fallback: "Phone")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension AppStrings {
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
