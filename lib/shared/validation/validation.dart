import 'package:form_field_validator/form_field_validator.dart';

final emailValidator = MultiValidator([
 RequiredValidator(errorText: 'Email field required'),
 MinLengthValidator(8, errorText: 'Email must be at least 8 digits'),
 PatternValidator(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+", errorText: 'Enter valid email'),
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password field required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits '),
  PatternValidator(r'(?=.?[#?!@$%^&-])',
      errorText: 'passwords must have at least one special character')
]);

final phoneValidator = MultiValidator([
  RequiredValidator(errorText: 'Phone field required'),
  MinLengthValidator(10, errorText: 'phone must be 10 digits long'),
  PatternValidator(r"^(?:[+0][1-9])?[0-9]{10}$",
      errorText: 'Enter a valid phone')
]);

final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'Name field required'),
  PatternValidator(r"[a-zA-Z]",
      errorText: 'Enter a valid name')
]);

final passwordLoginValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
]);

final emailLoginValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  PatternValidator(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      errorText: 'Enter a valid email')
]);