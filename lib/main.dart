import 'package:appsilon/app.dart';
import 'package:appsilon/injection.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
        url: 'https://nayixlapcizfzvzflqlc.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5heWl4bGFwY2l6Znp2emZscWxjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzUxMzUzNzksImV4cCI6MTk5MDcxMTM3OX0.ZZyfIrYRhZJuAWRBHwcIYTH5Uge-bgLfPB8cEVawDBU',
      );
  await configureDependencies();
  runApp(const App());
}
