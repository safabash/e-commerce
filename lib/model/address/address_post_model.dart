class AddressPostModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? pincode;
  AddressPostModel(
      {this.address, this.name, this.phone, this.city, this.pincode});
  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "address": address,
        "city": city,
        "pincode": pincode
      };
}
