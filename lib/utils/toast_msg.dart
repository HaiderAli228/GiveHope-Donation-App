import 'package:donation_app/utils/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage{
  static toastMsg(String msgIs){
    return  Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.themeColor,
        textColor: AppColor.themeTextColor,
        fontSize: 16.0
    );
  }
}