import 'package:http/http.dart' as http;
import 'dart:convert';
const apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkYW5pbWcwMkBvdXRsb29rLmVzIiwianRpIjoiNzYzMzg0NmEtZDEzMy00ZmMwLWI4MTMtOWM2ODBmNDBlMDJhIiwiaXNzIjoiQUVNRVQiLCJpYXQiOjE2NzcyMzUwMDUsInVzZXJJZCI6Ijc2MzM4NDZhLWQxMzMtNGZjMC1iODEzLTljNjgwZjQwZTAyYSIsInJvbGUiOiIifQ.xBIJxfCqm8I6cNdqdY6G6Ko6kpDIlpyKnqjfpFjI11A';

Future<void> fetchWeather() async {
  //Buscar en excel cod ciudad
  final cityId = 'ES15030'; // ID de A Coruña
  final url = 'https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/horaria/$cityId/?api_key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final dataUrl = jsonDecode(response.body)['datos'];
    final dataResponse = await http.get(Uri.parse(dataUrl));
    final weatherData = jsonDecode(dataResponse.body);

    // Trabajar con la información de la predicción meteorológica
  } else {
    throw Exception('Error al obtener la predicción meteorológica: ${response.statusCode}');
  }
  //petición chat gpt
  /*"hazme un texto para una predicción del tiempo para la ciudad de $ciudad con temperatura mínima de $grados_min grados y máxima de $grados_max grados "
      "con cielo $estado_cielo y posibilidad de lluvia al $pos_lluvia porciento y $humedad % de humedad para una persona mayor"*/
}