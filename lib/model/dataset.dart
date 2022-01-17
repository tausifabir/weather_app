class WeatherDemmyData {
  final int? max;
  final int? min;
  final int? current;
  final String? name;
  final String? day;
  final int? wind;
  final int? humidity;
  final int? chanceRain;
  final String image;
  final String? time;
  final String? location;

  WeatherDemmyData(
      {this.max,
      this.min,
      this.name,
      this.day,
      this.wind,
      this.humidity,
      this.chanceRain,
      required this.image,
      this.current,
      this.time,
      this.location});
}

List<WeatherDemmyData> todayWeather = [
  WeatherDemmyData(current: 23, image: "assets/rainy_2d.png", time: "10:00"),
  WeatherDemmyData(current: 21, image: "assets/thunder_2d.png", time: "11:00"),
  WeatherDemmyData(current: 22, image: "assets/rainy_2d.png", time: "12:00"),
  WeatherDemmyData(current: 19, image: "assets/snow_2d.png", time: "01:00")
];

WeatherDemmyData currentTemp = WeatherDemmyData(
    current: 21,
    image: "assets/thunder.png",
    name: "Thunderstorm",
    day: "Monday, 17 May",
    wind: 13,
    humidity: 24,
    chanceRain: 87,
    location: "Minsk");

WeatherDemmyData tomorrowTemp = WeatherDemmyData(
  max: 20,
  min: 17,
  image: "assets/sunny.png",
  name: "Sunny",
  wind: 9,
  humidity: 31,
  chanceRain: 20,
);

List<WeatherDemmyData> sevenDay = [
  WeatherDemmyData(
      max: 20,
      min: 14,
      image: "assets/rainy_2d.png",
      day: "Mon",
      name: "Rainy"),
  WeatherDemmyData(
      max: 22,
      min: 16,
      image: "assets/thunder_2d.png",
      day: "Tue",
      name: "Thunder"),
  WeatherDemmyData(
      max: 19,
      min: 13,
      image: "assets/rainy_2d.png",
      day: "Wed",
      name: "Rainy"),
  WeatherDemmyData(
      max: 18, min: 12, image: "assets/snow_2d.png", day: "Thu", name: "Snow"),
  WeatherDemmyData(
      max: 23,
      min: 19,
      image: "assets/sunny_2d.png",
      day: "Fri",
      name: "Sunny"),
  WeatherDemmyData(
      max: 25,
      min: 17,
      image: "assets/rainy_2d.png",
      day: "Sat",
      name: "Rainy"),
  WeatherDemmyData(
      max: 21,
      min: 18,
      image: "assets/thunder_2d.png",
      day: "Sun",
      name: "Thunder")
];
