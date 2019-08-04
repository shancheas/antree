class HomeModel {
  String walletAmount;
  List<Slides> slides;
  List<Outlets> outlets;

  HomeModel({this.walletAmount, this.slides, this.outlets});

  HomeModel.fromJson(Map<String, dynamic> json) {
    walletAmount = json['wallet_amount'];
    if (json['slides'] != null) {
      slides = new List<Slides>();
      json['slides'].forEach((v) {
        slides.add(new Slides.fromJson(v));
      });
    }
    if (json['outlets'] != null) {
      outlets = new List<Outlets>();
      json['outlets'].forEach((v) {
        outlets.add(new Outlets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet_amount'] = this.walletAmount;
    if (this.slides != null) {
      data['slides'] = this.slides.map((v) => v.toJson()).toList();
    }
    if (this.outlets != null) {
      data['outlets'] = this.outlets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slides {
  String id;
  String photo;
  String adminId;
  String delStatus;

  Slides({this.id, this.photo, this.adminId, this.delStatus});

  Slides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    adminId = json['admin_id'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['admin_id'] = this.adminId;
    data['del_status'] = this.delStatus;
    return data;
  }
}

class Outlets {
  String id;
  String merchantId;
  String outletName;
  String addressId;
  String phone;
  String collectVat;
  String vatRegNo;
  String invoicePrint;
  Null invoiceFooter;
  String printSelect;
  String kotPrint;
  String startingDate;
  String nextExpiry;
  String userId;
  String companyId;
  String delivery;
  String openingTime;
  String closingTime;
  String city;
  String province;
  String postalCode;
  String queueFeature;
  String booking;
  String eatingTime;
  String paymentTime;
  String cleaningTime;
  String outletCategory;
  String photo;
  String delStatus;

  Outlets(
      {this.id,
      this.merchantId,
      this.outletName,
      this.addressId,
      this.phone,
      this.collectVat,
      this.vatRegNo,
      this.invoicePrint,
      this.invoiceFooter,
      this.printSelect,
      this.kotPrint,
      this.startingDate,
      this.nextExpiry,
      this.userId,
      this.companyId,
      this.delivery,
      this.openingTime,
      this.closingTime,
      this.city,
      this.province,
      this.postalCode,
      this.queueFeature,
      this.booking,
      this.eatingTime,
      this.paymentTime,
      this.cleaningTime,
      this.outletCategory,
      this.photo,
      this.delStatus});

  Outlets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchant_id'];
    outletName = json['outlet_name'];
    addressId = json['address_id'];
    phone = json['phone'];
    collectVat = json['collect_vat'];
    vatRegNo = json['vat_reg_no'];
    invoicePrint = json['invoice_print'];
    invoiceFooter = json['invoice_footer'];
    printSelect = json['print_select'];
    kotPrint = json['kot_print'];
    startingDate = json['starting_date'];
    nextExpiry = json['next_expiry'];
    userId = json['user_id'];
    companyId = json['company_id'];
    delivery = json['delivery'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    city = json['city'];
    province = json['province'];
    postalCode = json['postal_code'];
    queueFeature = json['queue_feature'];
    booking = json['booking'];
    eatingTime = json['eating_time'];
    paymentTime = json['payment_time'];
    cleaningTime = json['cleaning_time'];
    outletCategory = json['outlet_category'];
    photo = json['photo'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['merchant_id'] = this.merchantId;
    data['outlet_name'] = this.outletName;
    data['address_id'] = this.addressId;
    data['phone'] = this.phone;
    data['collect_vat'] = this.collectVat;
    data['vat_reg_no'] = this.vatRegNo;
    data['invoice_print'] = this.invoicePrint;
    data['invoice_footer'] = this.invoiceFooter;
    data['print_select'] = this.printSelect;
    data['kot_print'] = this.kotPrint;
    data['starting_date'] = this.startingDate;
    data['next_expiry'] = this.nextExpiry;
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['delivery'] = this.delivery;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['city'] = this.city;
    data['province'] = this.province;
    data['postal_code'] = this.postalCode;
    data['queue_feature'] = this.queueFeature;
    data['booking'] = this.booking;
    data['eating_time'] = this.eatingTime;
    data['payment_time'] = this.paymentTime;
    data['cleaning_time'] = this.cleaningTime;
    data['outlet_category'] = this.outletCategory;
    data['photo'] = this.photo;
    data['del_status'] = this.delStatus;
    return data;
  }
}
