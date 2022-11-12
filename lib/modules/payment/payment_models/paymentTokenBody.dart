class PaymentTokenBody {
  String? authToken;
  int? amountCents;
  int? expiration;
  int? orderId;
  BillingData? billingData;
  String? currency;
  int? integrationId;
  String? lockOrderWhenPaid;

  PaymentTokenBody(
      {this.authToken,
        this.amountCents ,
        this.expiration = 3600,
        this.orderId,
        this.billingData,
        this.currency = 'EGP',
        this.integrationId = 1025192,
        this.lockOrderWhenPaid = 'false'});

  PaymentTokenBody.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    amountCents = json['amount_cents'];
    expiration = json['expiration'];
    orderId = json['order_id'];
    billingData = json['billing_data'] != null
        ? new BillingData.fromJson(json['billing_data'])
        : null;
    currency = json['currency'];
    integrationId = json['integration_id'];
    lockOrderWhenPaid = json['lock_order_when_paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    data['amount_cents'] = this.amountCents;
    data['expiration'] = this.expiration;
    data['order_id'] = this.orderId;
    if (this.billingData != null) {
      data['billing_data'] = this.billingData!.toJson();
    }
    data['currency'] = this.currency;
    data['integration_id'] = this.integrationId;
    data['lock_order_when_paid'] = this.lockOrderWhenPaid;
    return data;
  }
}

class BillingData {
  String? apartment;
  String? email;
  String? floor;
  String? firstName;
  String? street;
  String? building;
  String? phoneNumber;
  String? shippingMethod;
  String? postalCode;
  String? city;
  String? country;
  String? lastName;
  String? state;

  BillingData(
      {this.apartment,
        this.email,
        this.floor,
        this.firstName,
        this.street,
        this.building,
        this.phoneNumber,
        this.shippingMethod,
        this.postalCode,
        this.city,
        this.country,
        this.lastName,
        this.state});

  BillingData.fromJson(Map<String, dynamic> json) {
    apartment = json['apartment'];
    email = json['email'];
    floor = json['floor'];
    firstName = json['first_name'];
    street = json['street'];
    building = json['building'];
    phoneNumber = json['phone_number'];
    shippingMethod = json['shipping_method'];
    postalCode = json['postal_code'];
    city = json['city'];
    country = json['country'];
    lastName = json['last_name'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apartment'] = this.apartment;
    data['email'] = this.email;
    data['floor'] = this.floor;
    data['first_name'] = this.firstName;
    data['street'] = this.street;
    data['building'] = this.building;
    data['phone_number'] = this.phoneNumber;
    data['shipping_method'] = this.shippingMethod;
    data['postal_code'] = this.postalCode;
    data['city'] = this.city;
    data['country'] = this.country;
    data['last_name'] = this.lastName;
    data['state'] = this.state;
    return data;
  }
}
