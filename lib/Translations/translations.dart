import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // Arabic Strings...
        'ar': {
          'home': 'الرئسية',
          'menu': 'القائمة',
          'cart': 'السلة',
          'track_order': 'تتبع الطلب',
          'more_info': 'المزيد',
          'order_now': 'اطلب الان',
          'branches': 'الفروع',
          'branch': 'الفرع',
          'contact_us': 'ارقام التليفونات',
          'socials': 'مواقع التواصل',
          'starts_with': 'يبدأ من',
          'price': 'السعر',
          'price_coin': 'جنيها',
          'pick_size': 'اختار الحجم',
          'ingredients': 'المكونات',
          'extras': 'الإضافات',
          'drinks': 'المشروبات',
          'general_extras': 'إضافات عامة',
          'phone_number': 'أدخل رقم الهاتف',
          'valid_phone': 'الرجاء ادخال قيم صالحة',
          'user_name': 'إسم المستخدم',
          'password': 'كلمة المرور',
          'register_user': 'تسجيل المستخدم',
          'confirm_user': 'تسجيل المستخدم',
          'resend_code': 'إعادة إرسال الكود',
          'error': 'خطأ',
          'wrong_code': 'برجاء إدخال الكود الصحيح',
          'add_to_cart': 'إضافه إلي السلة',
          'no_products_meal': 'لايوجد منتجات',
          'no_products_cart': 'أضف منتجات إلي السلة',
          'added_to_cart': 'تم الإضافه إلي السلة ',
          'total': 'الإجمالي',
          'with_tax': 'شامل الضريبه',
          'continue_shopping': 'متابعة الشراء',
          'proceed_check_out': 'إنهاء عملية الشراء',
          'checkOut_onOrder': 'حدد تفاصيل التسليم',
          'quantity': 'الكميه',

          'checkOut_onOrder_title':
              'للمتابعة يرجي تأكيد تفاصيل التسليم الخاصه بك',
          'receive_from': 'الإستلام من الفرع',
          'deliver_to': 'التوصيل إلي العنوان',
          'specify_address': 'حدد تفاصيل العنوان',
          'enter_address': 'من فضلك ادخل العنوان',
          'address': 'أدخل العنوان بالتفصيل',
          'your_address': ' العنوان  ',
          'add_new_address': 'أضف عنوان جديد',
          'neighbourhood': 'برجاء اختيار الحي',
          'building_number': 'رقم العمارة',
          'area_number': 'رقم المنطقة',
          'floor_number': 'رقم الشقة',
          'land_mark': ' علامة مميزة',
          'data': 'من فضلك ادخال باقي البيانات',
          'add_address': 'اضف العنوان',
          'choose_branch_drop_down': 'إختار الفرع',
          'check_out': 'متابعة الطلب',
          'please_choose_branch': 'برجاء اختيار الفرع',
          'confirm': 'تأكيد الطلب',
          'tax': 'الضريبة',
          'discount': 'الخصم',
          'delivery': 'التوصيل',
          'service_fee': 'الخدمة',
          'total_sum': 'المجموع',
          'done': 'تم',
          'voucher_code': 'أدخل كود الخصم',
          'leave_a_comment': ' . . . اترك رسالة',
          'order_time': 'تاريخ و وقت الطلب',
          'total_price': 'إجمالي السعر',
          'order_status': 'حالة الطلب',
          'cancel': 'إلغاء',
          'order_details': 'تفاصيل الطلب',
          'no_orders': 'لايوجد طلبيات سابقة',
          'language': 'اللغه',
          'continue': 'متابعة',
          'sorry': 'عفواً',
          'type': 'النوع',
          'sauces': 'الصلصات',
          'closed_now': 'المطعم مغلق حاليا',
          'coin_jordan': 'دينار',
          'order_content': 'المحتويات',
          'delete_account': 'حذف الحساب',
          'delete_account_alert': 'هل تريد حذف الحساب',
          'no_account': 'لايوجد حساب',
          'choose_only_4_items': 'اختر ٤ انواع فقط',
          'deletion_successful': 'تم حذف حسابك بنجاح',
          'no_sauces_for_this_item': 'لا يوجد صلصات لهذا المنتج',
          'no_types_for_this_item': 'لا يوجد انواع لهذا المنتج',
          'no_additional_for_this_item': 'لا يوجد اضافات اخري لهذا المنتج',
          'no_drinks_for_this_item': 'لا يوجد مشروبات لهذا المنتج',
          'yes': 'نعم',
          'no': 'لا',
         'check':'ادخل الكود',
          'cash_payment': 'الدفع عند الاستلام',
          'credit_card_payment': 'الدفع عن طريق الفيزا',
          'wallet_balance': 'رصيد المحفظة',
          'not_enough': 'غير كافي',
          'no_connection': 'غير متصل',
          'connected': 'متصل',
          'sorry': 'عفوا',
          'you_can\'t_order_less_than_one': 'لا يمكنك أن تطلب أقل من واحد ',
          'there_is_no_sufficient_quantity': 'لا توجد كميه كافيه',

},

        // English Strings...
        'en': {
          'home': 'Home',
          'menu': 'Menu',
          'cart': 'Cart',
          'branch': 'Branch',
          'track_order': 'Track Order',
          'more_info': 'More Info',
          'order_now': 'Order Now',
          'branches': 'Branches',
          'contact_us': 'Phone Numbers',
          'socials': 'Socials',
          'starts_with': 'Starts from',
          'price': 'Price',
          'drinks': 'Drinks',
          'price_coin': 'EGP',
          'quantity': 'Quantity',
          'pick_size': 'Sizes',
          'ingredients': 'Ingredients',
          'extras': 'Additions',
          'type': 'Type ',
          'sauces': 'Sauces',
          'general_extras': 'General Extras',
          'add_to_cart': 'Add To Cart',
          'no_products_meal': 'No Products',
          'no_products_cart': 'Add Products To Cart',
          'added_to_cart': 'Added To Your Cart',
          'total': 'Total',
          'with_tax': 'Taxes Included',
          'continue_shopping': 'Continue Shopping',
          'proceed_check_out': 'Proceed To Checkout',
          'checkOut_onOrder': 'Specify Order Details',
          'checkOut_onOrder_title': 'Confirm Order Details',
          'receive_from': 'Receive From Branch',
          'deliver_to': 'Deliver To Address',
          'add_new_address': 'Add New Address',
          'specify_address': 'Specify Address Details',
          'address': 'Specify Address Details ',
          'your_address': ' Address  ',
          'neighbourhood': 'Select Neighbourhood',
          'building_number': 'Building.No',
          'floor_number': 'Floor.No',
          'data': 'Please Enter Other Fields',
          'land_mark': 'Land Mark . . . ',
          'add_address': 'Add Address',
          'choose_branch_drop_down': 'Choose A Branch',
          'check_out': 'Checkout',
          'please_choose_branch': 'Please Choose A Branch',
          'confirm': 'Confirm Order',
          'tax': 'Tax',
          'discount': 'Discount',
          'delivery': 'Delivery',
          'service_fee': 'Service Fee',
          'total_sum': 'Total Sum',
          'done': 'Done',
          'receipt' :'Receipt',
          'area_number': 'Area Number',
          'voucher_code': 'Enter Voucher Code',
          'leave_a_comment': 'Leave A Comment . . .',
          'order_time': 'Order\'s Time And Date',
          'total_price': 'Total Price',
          'order_status': 'Order Status',
          'cancel': 'Cancel',
          'choose_only_4_items': 'Choose only 4 items',
          'order_details': 'Order Details',
          'no_orders': 'No Orders',
          'language': 'Language',
          'continue': 'Continue',
          'sorry': 'Sorry',
          'closed_now': 'Restaurant Closed',
          'phone_number': 'Enter The Phone Number',
          'user_name': 'User Name',
          'password': 'Password',
          'register_user': 'Register User',
          'confirm_user': 'Confirm',
          'resend_code': 'Resend Code',
          'no_sauces_for_this_item': 'No Sauces for this item',
          'no_types_for_this_item': 'No Types for this item',
          'no_drinks_for_this_item': 'No Drinks for this item',
          'no_additional_for_this_item': 'No Additionals for this item',
          'valid_phone': 'Please enter a valid phone number',
          'error': 'Error',
          'enter_address': 'Please Enter An Address',
          'coin_jordan': 'Jordanian Dinar',
          'delete_account': 'Delete Account',
          'delete_account_alert': 'Do You Want To Delete The Account',
          'no_account': 'No Account Found',
          'order_content': 'Content',
          'deletion_successful': 'Your Account Was Deleted Successfully',
          'there_is_no_sufficient_quantity': 'There is no sufficient quantity',
          'you_can\'t_order_less_than_one': 'You can\'t order less than a piece',
          'yes': 'Yes',
          'no': 'No',
          'connected': 'connected',
          'sorry': 'Sorry',
          'cash_payment': 'Cash Payment',
          'credit_card_payment': 'Credit Card Payment',
          'wallet_balance': 'Wallet Balance',
          'not_enough': 'Not Enough',
          'no_connection': 'no_connection',
          'check':'Check'
        }
      };
}