import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:tesis_1/app/data/repositories_impl/account_repository_impl.dart';
import 'package:tesis_1/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:tesis_1/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:tesis_1/app/domain/repositories/account_repository.dart';
import 'package:tesis_1/app/domain/repositories/authentication_repository.dart';
import 'package:tesis_1/app/domain/repositories/sign_up_repository.dart';
import 'package:tesis_1/app/domain/repositories/email_repository.dart';
import 'package:tesis_1/app/data/repositories_impl/email_repository_impl.dart';

void injectDependencies() {
  Get.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(FirebaseAuth.instance),
  );

  Get.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
  Get.lazyPut<EmailRepository>(
    () => EmailRepositoryImpl(FirebaseAuth.instance),
  );
}
