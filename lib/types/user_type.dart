class UserType {
  String? firstName;
  String? lastName;
  String? uid;
  // String? email;

  UserType({
    this.firstName,
    this.lastName,
    this.uid,
    // this.email,
  });

  bool userMainDataPresent() {
    return uid != null &&
        // email != null &&
        firstName != null &&
        lastName != null;
  }
}
