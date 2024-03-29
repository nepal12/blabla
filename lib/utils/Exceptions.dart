abstract class BlablaException implements Exception{
    String errorMessage();
}
class UserNotFoundException extends BlablaException{
  @override
  String errorMessage() => 'No user found for provided uid/username';

}
class UsernameMappingUndefinedException extends BlablaException{
  @override
  String errorMessage() =>'User not found';

}
class ContactAlreadyExistsException extends BlablaException{
  @override
  String errorMessage() => 'Contact already exists!';
}