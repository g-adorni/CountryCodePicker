import 'package:country_nationality_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale("it"),
      ],
      locale: const Locale('it', 'IT'),
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CountryPicker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const CountryCodePicker(
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: ['IT'],
                showCountryOnly: true,

                // comparator: (a, b) => b.name.compareTo(a.name),
                // //Get the country information relevant to the initial selection
                // onInit: (code) => debugPrint(
                //     "on init ${code.name} ${code.dialCode} ${code.name}"),
              ),
              CountryCodePicker(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: const ['+39', 'FR'],

                flagDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              const SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePicker(
                  onChanged: print,
                  hideMainText: true,
                  showFlagMain: true,
                  showFlag: false,
                  initialSelection: 'TF',
                  hideSearch: true,
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  alignLeft: true,
                ),
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePicker(
                  onChanged: (element) => debugPrint(element.toLongString()),
                  initialSelection: 'TF',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  favorite: const ['+39', 'FR'],
                ),
              ),
              SizedBox(
                width: 100,
                height: 60,
                child: CountryCodePicker(
                  enabled: false,
                  onChanged: (c) => c.name,
                  initialSelection: 'TF',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  favorite: const ['+39', 'FR'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
