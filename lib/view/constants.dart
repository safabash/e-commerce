import 'package:flutter/material.dart';

//api Url
const baseUrl = 'http://172.16.3.169:6000/api/v1';
const loginUrl = '/login';
const registerUrl = '/register';
const otpUrl = '/verifyOtp';

//

const fontStyle = TextStyle(fontFamily: 'Radley');
const kcolor = Color.fromARGB(255, 232, 185, 85);
const titleStyleSingleProduct = TextStyle(
  fontFamily: 'Radley',
  fontSize: 24,
);

const appBarTitle =
    TextStyle(fontFamily: 'Radley', fontSize: 20, color: Colors.black);
const detailStyleSingleProduct = TextStyle(
  fontFamily: 'Radley',
  fontSize: 18,
);
const drawerTitlestyle =
    TextStyle(fontFamily: 'Radley', fontSize: 18, color: Colors.white);
List<String> images = [
  'https://www.lulus.com/images/product/xlarge/4619211_28024.jpg?w=400&hdpi=1',
  'https://www.lulus.com/images/product/xlarge/5451971_663902.jpg',
  'https://www.lulus.com/images/product/xlarge/8341341_1721996.jpg?w=560&hdpi=1'
];

const boxw10 = SizedBox(width: 10);
const boxheight10 = SizedBox(height: 10);
const boxheight20 = SizedBox(height: 20);
