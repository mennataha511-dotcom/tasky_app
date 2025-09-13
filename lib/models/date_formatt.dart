import 'package:intl/intl.dart';

extension DateFormatt on DateTime
{
  formatDate(){
    return  DateFormat.yMMMMEEEEd().format(this);
  }

}