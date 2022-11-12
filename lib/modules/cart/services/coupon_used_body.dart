class CouponUsedBody{
  String? couponCode;
  String? phoneNumber;

  CouponUsedBody({
    this.couponCode,
    this.phoneNumber,
});

  CouponUsedBody.fromJson(Map<String , dynamic> json){
    couponCode = json['coupon_code'];
    phoneNumber = json['phone_number'];
  }

  Map<String , dynamic> toJson(){
    final Map<String , dynamic> data = {};
    data['coupon_code'] = couponCode;
    data['phone_number'] = phoneNumber;

    return data;
  }
}