class Country {
  const Country(this.name, this.domain);
  final String name;
  final String domain;
}

const Country unitedArabEmirates = Country("United Arab Emirates", "ae");
const Country switzerland = Country("Switzerland", "ch");
const Country russia = Country("Россия", "ru");
const Country india = Country("India", "in");
const Country unitedStates = Country("United States", "us");
const Country korea = Country("Korea", "kr");
const Country turkey = Country("Türkiye", "tr");
const Country ukraine = Country("Українф", "ua");
const Country italy = Country("Italy", "it");

const Set<Country> countries = {
  unitedArabEmirates,
  switzerland,
  russia,
  india,
  unitedStates,
  korea,
  turkey,
  ukraine,
  italy,
};
