class TravelList {
  String name;
  String price;
  String description;
  String airport;
  String date;
  String kuota;
  String hotel;
  String image;

  TravelList({
    required this.name,
    required this.price,
    required this.description,
    required this.airport,
    required this.date,
    required this.kuota,
    required this.hotel,
    required this.image,
  });
}

var travelList = [
  TravelList(
      name: "Umroh 16 Hari",
      price: "30.000.000",
      description:
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to mak",
      airport: "Soekarno Hatta (CGK)",
      date: "01 Januari 2023",
      kuota: "300",
      hotel: "Elaf Ajyad Hotel dan  Rotana Al Mesk Hotel",
      image:
          "https://images.unsplash.com/photo-1577889933775-33b8571874c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
  TravelList(
      name: "Umroh 24 Hari",
      price: "39.000.000",
      description:
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to mak",
      airport: "Soekarno Hatta (CGK)",
      date: "01 Januari 2023",
      kuota: "300",
      hotel: "Elaf Ajyad Hotel dan  Rotana Al Mesk Hotel",
      image:
          "https://dmm0a91a1r04e.cloudfront.net/1Sb4XfzyZPs1TzEh3kBs_GkIFag=/1024x576/https%3A%2F%2Fasset.kgnewsroom.com%2Fphoto%2Fpre%2F2022%2F06%2F11%2F0d966002-27db-4c8f-9f9e-6914a18d21a4_jpg.jpg"),
  TravelList(
      name: "Hajji Furoda",
      price: "259.000.000",
      description:
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to mak",
      airport: "Soekarno Hatta (CGK)",
      date: "01 Juli 2023",
      kuota: "10",
      hotel: "Elaf Ajyad Hotel dan  Rotana Al Mesk Hotel",
      image:
          "https://umroh.com/blog/wp-content/uploads/2019/02/Tempat-Menarik-di-Mekkah-1308201901.jpg"),
];
