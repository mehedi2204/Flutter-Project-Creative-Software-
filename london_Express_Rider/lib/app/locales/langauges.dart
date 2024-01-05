final List<LanguageModel> languages = [
  LanguageModel("English", "en_US"),
  LanguageModel("Bengali", "bn"),

];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}
