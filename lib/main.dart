import 'package:flutter/material.dart';
import 'Network/checknetwork.dart';
import 'resources/theme.dart';
import 'screens/customer_list_screen.dart';
import 'providers/customer_provider.dart';
import 'package:provider/provider.dart';
import 'services/No_Connection_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check internet connectivity
  final isConnected = await Network.checkInternetConnectivity();

  // Initialize the CustomerProvider and load data
  final customerProvider = CustomerProvider();
  await customerProvider.loadFromLocalStorage();

  // Run the app with the initialized CustomerProvider and connectivity status

  runApp(MyApp(isConnected: isConnected, customerProvider: customerProvider));
}

class MyApp extends StatelessWidget {
  final bool isConnected;
  final CustomerProvider customerProvider;

  MyApp({required this.isConnected, required this.customerProvider, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Use ChangeNotifierProvider to provide the CustomerProvider instance
      // to the widget tree, allowing widgets to listen to changes in customer data.
      // The .value constructor is used here to pass an existing instance of CustomerProvider
      // rather than creating a new one, which is useful for initializing with existing data.
      providers: [
        ChangeNotifierProvider<CustomerProvider>.value(
          value: customerProvider,
        ),
      ],
      child: MaterialApp(
        title: 'Customer CRUD App',
        theme: AppTheme.lightTheme,
        home: isConnected ? const CustomerListScreen() : NoConnectionScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
