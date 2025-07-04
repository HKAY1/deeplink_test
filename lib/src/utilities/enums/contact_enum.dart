enum ContactEnum {
  contact,
  expense,
  paymentMode;

  // Getter to return a description for each transaction type
  static ContactEnum typeEnum(int value) {
    switch (value) {
      case 1:
        return ContactEnum.contact;
      case 2:
        return ContactEnum.expense;
      case 3:
        return ContactEnum.paymentMode;
      default:
        return ContactEnum.contact;
    }
  }

  // Getter to determine if the transaction is positive or negative
  int get value {
    switch (this) {
      case ContactEnum.contact:
        return 1; // Positive impact
      case ContactEnum.expense:
        return 2; // Negative impact
      case ContactEnum.paymentMode:
        return 3;
    }
  }

  String get text {
    switch (this) {
      case ContactEnum.contact:
        return "Contact"; // Positive impact
      case ContactEnum.expense:
        return "Expense"; // Negative impact
      case ContactEnum.paymentMode:
        return "Payment Mode";
    }
  }
}
