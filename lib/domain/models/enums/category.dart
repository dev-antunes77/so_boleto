enum Category {
  rent,
  groceries,
  transportation,
  automobile,
  insurance,
  communication,
  entertainment,
  healthCare,
  creditCard,
  travel,
  debt,
  investiment,
  miscellaneous,
}

List<String> values = Category.values.map((e) => e.name).toList();
