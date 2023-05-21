import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteSource {
  Future<void> signIn({required String username, required String password});
  Future<void> signOut();
}

@Injectable(as: AuthRemoteSource)
class SupabaseAuthSource implements AuthRemoteSource {
  final _supabase = Supabase.instance.client;

  @override
  Future<void> signIn(
      {required String username, required String password}) async {
    await _supabase.auth.signInWithPassword(
      email: '$username@gmail.com',
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
