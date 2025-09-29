class AppValidator {
 static appValidator({required String input, required ValidationType type}) {
    if(type==ValidationType.email) {
        if(input=='')
          {
            return 'This Field is required';
          }
        else if(!emailRegex.hasMatch(input))
            {
               return'Enter a valid email address ';
            }
        else
          {return null;}
      }
    else if(type==ValidationType.password)
      {
        if(input=='')
          {return 'This Field Is Required';}
        else if(input.length<8)
          {
            return'Password should be more than 8 char';
          }
        else {
          return null;
        }
      }
    else if (type == ValidationType.phoneNumber) {
      if (input.isEmpty) {
        return 'This Field is required';
      } else if (!phoneRegex.hasMatch(input)) {
        return 'Enter a valid phone number';
      } else {
        return null;
      }
    }
    else if (type == ValidationType.name) {
      if (input.isEmpty) {
        return 'This Field is required';

      } else {
        return null;
      }
    }
  }
}

enum ValidationType { name,email, phoneNumber, password }

RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
);
RegExp phoneRegex = RegExp(
  r"^\+?[0-9]{10,15}$",
);