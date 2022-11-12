class PaymentOrdersBody {
  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  int? terminalId;

  PaymentOrdersBody(
      {required this.authToken,
        this.deliveryNeeded = "false",
        this.amountCents = "15000",
        this.currency = "EGP",
        this.terminalId= 23772});

  PaymentOrdersBody.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    deliveryNeeded = json['delivery_needed'];
    amountCents = json['amount_cents'];
    currency = json['currency'];
    terminalId = json['terminal_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    data['delivery_needed'] = this.deliveryNeeded;
    data['amount_cents'] = this.amountCents;
    data['currency'] = this.currency;
    data['terminal_id'] = this.terminalId;
    return data;
  }
}
