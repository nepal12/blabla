
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blabla/blocs/attachments/AttachmentsBloc.dart';
import 'package:blabla/blocs/chats/Bloc.dart';
import 'package:blabla/blocs/contacts/Bloc.dart';
import 'package:blabla/blocs/home/Bloc.dart';
import 'package:blabla/config/Constants.dart';
import 'package:blabla/pages/HomePage.dart';
import 'package:blabla/repositories/AuthenticationRepository.dart';
import 'package:blabla/repositories/ChatRepository.dart';
import 'package:blabla/repositories/StorageRepository.dart';
import 'package:blabla/repositories/UserDataRepository.dart';
import 'package:blabla/utils/SharedObjects.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/authentication/Bloc.dart';
import 'config/Palette.dart';
import 'pages/RegisterPage.dart';

void main() async {
  //create instances of the repositories to supply them to the app
  final AuthenticationRepository authRepository = AuthenticationRepository();
  final UserDataRepository userDataRepository = UserDataRepository();
  final StorageRepository storageRepository = StorageRepository();
  final ChatRepository chatRepository = ChatRepository();
  SharedObjects.prefs = await CachedSharedPreferences.getInstance();
  Constants.cacheDirPath = (await getTemporaryDirectory()).path;
  Constants.downloadsDirPath = (await DownloadsPathProvider.downloadsDirectory).path;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        builder: (context) => AuthenticationBloc(
            authenticationRepository: authRepository,
            userDataRepository: userDataRepository,
            storageRepository: storageRepository)
          ..dispatch(AppLaunched()),
      ),
      BlocProvider<ContactsBloc>(
        builder: (context) => ContactsBloc(
            userDataRepository: userDataRepository,
            chatRepository: chatRepository),
      ),
      BlocProvider<ChatBloc>(
        builder: (context) => ChatBloc(
            userDataRepository: userDataRepository,
            storageRepository: storageRepository,
            chatRepository: chatRepository),
      ),
      BlocProvider<AttachmentsBloc>(
        builder: (context) => AttachmentsBloc(chatRepository: chatRepository),
      ),
      BlocProvider<HomeBloc>(
        builder: (context) => HomeBloc(chatRepository: chatRepository),
      )
    ],
    child: Blabla(),
  ));
}

class Blabla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'blabla',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Palette.primaryColor, fontFamily: 'Manrope'),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          // return AttachmentPage();
          if (state is UnAuthenticated) {
            return RegisterPage();
          } else if (state is ProfileUpdated) {
            //TODO return home here
            BlocProvider.of<ChatBloc>(context).dispatch(FetchChatListEvent());
            return HomePage();
            //  return ConversationPageSlide();
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
