import 'package:app/helpers/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Locale _selectedLocale;

  // @override
  // void initState() {
  //   super.initState();
  //   _selectedLocale = context.locale;
  // }

  @override
  void didChangeDependencies() {
    _selectedLocale = context.locale;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'message'.tr(),
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                DropdownButton<Locale>(
                  value: _selectedLocale,
                  onChanged: (Locale? locale) {
                    if (locale != null) {
                      setState(() {
                        _selectedLocale = locale;
                        context.setLocale(locale);
                      });
                    }
                  },
                  items: supportedLanguages.map((lang) {
                    return DropdownMenuItem<Locale>(
                      value: lang['locale'],
                      child: Text(lang['name'] as String),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale('en'));
                    },
                    child: Text("reset"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
