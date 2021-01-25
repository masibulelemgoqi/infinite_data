import 'package:auto_route/auto_route_annotations.dart';
import 'package:infinite_data/views/auth/login.dart';
import 'package:infinite_data/views/auth/packages.dart';
import 'package:infinite_data/views/auth/register.dart';
import 'package:infinite_data/views/other/welcome.dart';
import 'package:infinite_data/views/screening/search_home.dart';
import 'package:infinite_data/views/screening/search_results.dart';
import 'package:infinite_data/views/screening/view_customer.dart';

@autoRouter
class $Routes {
  @initial
  WelcomePage welcomePage;
  Login login;
  Register register;
  Packages packages;
  SearchHome searchHome;
  SearchResults searchResults;
  ViewCustomer viewCustomer;
}
