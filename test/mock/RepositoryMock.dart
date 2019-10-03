import 'package:blabla/repositories/AuthenticationRepository.dart';
import 'package:blabla/repositories/StorageRepository.dart';
import 'package:blabla/repositories/UserDataRepository.dart';
import 'package:mockito/mockito.dart';

class AuthenticationRepositoryMock extends Mock implements AuthenticationRepository{}
class UserDataRepositoryMock extends Mock implements UserDataRepository{}
class StorageRepositoryMock extends Mock implements StorageRepository{}