class CouponBody
{
  String? discountCode;
  String? phoneNumber;

  CouponBody({this.discountCode , this.phoneNumber});

  CouponBody.fromJson(Map<String,dynamic> json)
  {
     this.discountCode = json['coupon_code'] ;
     this.phoneNumber = json['phone_number'];
  }

  Map<String,dynamic>toJson()
  {
    Map<String,dynamic> data = new Map<String, dynamic>();
    if(this.discountCode!=null){data['coupon_code']=this.discountCode;
      data['phone_number'] = this.phoneNumber;
    }
    return data;
  }

}