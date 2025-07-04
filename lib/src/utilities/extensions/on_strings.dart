final RegExp otherThanDigitsAndDash = RegExp(r'[^\d-]');
final RegExp startsOrEndsWithDash = RegExp(r'^-|-$');
final RegExp multipleDashes = RegExp(r'-{2,}');

extension StringsExtension on String? {
  bool isValidEmail() {
    if (this == null) return false;
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this!);
  }

  bool isValidPhone(String text) {
    if (this == null) return false;
    if (text.contains(otherThanDigitsAndDash) ||
        text.contains(startsOrEndsWithDash) ||
        text.contains(multipleDashes)) {
      return false;
    }
    return true;
  }

  String capitalize() {
    if (isNullOrEmpty()) return '';
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  String? capitalizeFirstLetterOfEachWord() {
    if (this == null) return this;
    List<String> words = this!.split(' ');
    List<String> capitalizedWords = <String>[];

    for (String word in words) {
      if (word.isNotEmpty) {
        String capitalizedWord = word[0].toUpperCase() + word.substring(1);
        capitalizedWords.add(capitalizedWord);
      } else {
        capitalizedWords.add(word);
      }
    }

    return capitalizedWords.join(' ');
  }

  String? removeSpecialCharacters() {
    if (this == null) return this;
    RegExp specialCharRegExp = RegExp(r'[^\w\s]', multiLine: true);
    return this!.replaceAll(specialCharRegExp, '');
  }

  bool isNullOrEmpty() {
    if (this == null) {
      return true;
    } else if (this == 'null') {
      return true;
    }
    return this!.isEmpty;
  }

  bool isNotNullNorEmpty() {
    if (this == null) {
      return false;
    }
    return this!.isNotEmpty;
  }
}
