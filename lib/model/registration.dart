class RegistrationModel{
 final String? name;
 final String? birthDay;
 final String? email;
 final String? gender;
 final String? idToken;


  RegistrationModel({this.name, this.birthDay, this.email,this.gender,this.idToken});

  @override
  String toString() {
    return 'RegistrationModel{name: $name, idToken: $idToken, birth_date: $birthDay, email: $email, gender: $gender}';
  }
}