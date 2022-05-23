class RegExpUtils {
  static final RegExp hashtag = RegExp(r"\B#[a-zA-Z0-9]+\b");

  static final RegExp mention = RegExp(r"\B@[a-zA-Z0-9]+\b");

  static final RegExp email = RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b');

  static final RegExp link =
      RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');

  static bool isHashtag(String text) => text.contains(hashtag);

  static bool isMention(String text) => text.contains(mention);

  static bool isEmail(String text) => text.contains(email);

  static bool isLink(String text) => text.contains(link);
}
