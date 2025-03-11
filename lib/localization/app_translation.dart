import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'hello': 'Hello!',
      'select_language': 'Select Language',
      'dark_mode': 'Activate Dark Mode',
      'dark_mode_sub': 'Click to switch between light and dark mode',
      'language': 'App Language',
      'language_sub': 'Select your preferred language',
    },
    'es': {
      'hello': '¡Hola!',
      'select_language': 'Seleccionar idioma',
      'dark_mode': 'Activar modo oscuro',
      'dark_mode_sub': 'Haz clic para cambiar entre claro y oscuro',
      'language': 'Idioma de la aplicación',
      'language_sub': 'Seleccione su idioma preferido',
    },
    'fr': {
      'hello': 'Bonjour!',
      'select_language': 'Choisir la langue',
      'dark_mode': 'Activer le mode sombre',
      'dark_mode_sub': 'Cliquez pour basculer entre clair et sombre',
      'language': 'Langue de l\'application',
      'language_sub': 'Sélectionnez votre langue préférée',
    },
  };
}