import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final googleSignIn = GoogleSignIn();
//FacebookLogin facebookLogin = FacebookLogin();


Future<User> google_sign_in() async {

  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  if(googleSignIn != null)
  {
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken , accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(credential);

    User user = await auth.currentUser;

    return user;
  }
  return null;
}


//signUp using simple email and password
Future<bool> signUp(String email,String password) async {
  try{
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return Future.value(true);
  }catch(e)
  {
    switch (e){
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        print('already used email error');
    }
  }
}

//signIn using email and password
Future<bool> signIn(String email,String password) async {
  try{
    UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
    return Future.value(true);
  }catch(e)
  {
    switch (e){
      case 'ERROR_INVALID_EMAIL':
        print('Invalid email used');
    }
  }
}

//signOut the user currently not using
Future<bool> signOutUser() async{

  User user = await auth.currentUser;
  try{
    await googleSignIn.disconnect();
  }
  catch (e){
    print(e);
  }

  await auth.signOut();
  print('disconnecting from auth servcies');
}

Future<User> getCurrentUser() async{
  User user = await auth.currentUser;
  return user;
}
/*
//for facebook login
Future loginWithFacebook(FacebookLoginResult _result)async{
  FacebookAccessToken _accessToken = _result.accessToken;
  AuthCredential credential = FacebookAuthProvider.credential(_accessToken.token);
  var a = await auth.signInWithCredential(credential);
  User user = a.user;

}
//for facebook error handling
Future handleLogin() async {
  FacebookLoginResult _result = await facebookLogin.logIn(['email']);
  switch (_result.status)
  {
    case FacebookLoginStatus.cancelledByUser:
      print("facebook login cancelled by the user");
      break;

    case FacebookLoginStatus.error:
      print("FacebookLogin error");
      break;
    case FacebookLoginStatus.loggedIn:
      await loginWithFacebook(_result);
      break;

  }
}
*/

