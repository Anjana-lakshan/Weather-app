class Sys {

   String country;
   int timezone;
   int sunrise;
   int sunset;

   Sys.fromJson(Map<String, dynamic> json){
     this.country = json['country'];
     this.timezone = int.parse(json['timezone'].toString());
     this.sunrise = int.parse(json['sunrise'].toString());
     this.sunset = int.parse(json['sunset'].toString());
   }
}
