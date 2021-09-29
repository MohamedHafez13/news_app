
String baseUrl="https://newsapi.org/";
String url = "v2/top-headlines";
String url1 = "v2/everything";
String apiKey = "f1c8c3abf96f4bbda5a7664d74e1af50";

Map<String,dynamic>businessNewsQuery ={
  'country':'eg',
  'category':'business',
  'apiKey': '$apiKey',
};
Map<String,dynamic>appleNewsQuery ={

  'q':'apple',
  'from':'2021-09-26',
  'to':'2021-09-26',
  'sortBy':'popularity',
  'apiKey': '$apiKey',
};
Map<String,dynamic> streetNewsQuery ={
  'domains':'wsj.com',
  //'category':'business',
  'apiKey': '$apiKey',
};
// Map<String,dynamic> teslaNewsQuery ={
//
//   'q':'tesla',
//   'from':'2021-08-27',
//   'sortBy':'publishedAt',
//   'apiKey': '$apiKey',
// };