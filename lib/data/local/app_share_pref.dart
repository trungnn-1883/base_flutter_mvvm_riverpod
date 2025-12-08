import 'package:flutter_mvvm_riverpod/model/pomodoro.dart';

abstract class AppSharePref {
  /// Sets whether the app tutorial has been shown.
  ///
  /// @param isShown A boolean indicating if the tutorial has been shown (true) or not (false).
  /// @return A Future that completes when the operation is finished.
  Future<void> setAppTutorialShown(bool isShown);

  /// Checks if the app tutorial has been shown.
  ///
  /// @return A Future that resolves to a boolean value:
  ///   - true if the app tutorial has been shown
  ///   - false if the app tutorial has not been shown
  Future<bool> isAppTutorialShown();

  /// Retrieves the user's preferred language code.
  ///
  /// @return A Future that resolves to a String representing the language code, or null if not set.
  Future<String?> getPreferredLanguageCode();

  /// Stores the user's preferred language code.
  ///
  /// @param languageCode A String representing the language code to store, or null to clear the stored value.
  /// @return A Future that completes when the operation is finished.
  Future<void> setPreferredLanguageCode(String? languageCode);

  /// Checks if this is the first launch of the app.
  ////
  /// @return A Future that resolves to a boolean value:
  ///   - true if this is the first launch
  ///   - false if the app has been launched before
  ///
  Future<bool> isFirstLaunch();

  /// Sets whether this is the first launch of the app.
  /// // @param isFirstLaunch A boolean indicating if this is the first launch (true) or not (false).
  /// @return A Future that completes when the operation is finished.
  Future<void> setFirstLaunch(bool isFirstLaunch);

  /// Gets the stored username.
  Future<String?> getUserName();

  /// Sets the username.
  Future<void> setUserName(String userName);

  /// Gets the stored random quote.
  Future<String?> getRandomQuote();

  /// Sets the random quote.
  Future<void> setRandomQuote(String quote);

  /// Gets the stored Pomodoro object.
  Future<Pomodoro?> getPomodoro();

  /// Sets the Pomodoro object.
  Future<void> setPomodoro(Pomodoro pomodoro);
}
