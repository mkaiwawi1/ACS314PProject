class MyDash {
  final String artname;
  final String image;
  final String link;

  const MyDash({
    required this.artname,
    required this.image,
    required this.link,
  });
}

List<MyDash> dashes = [
  MyDash(
    artname: "Quick Search",
    image: "assets/dashpics/google.jpg",
    link: "https://www.google.com",
  ),
  MyDash(
    artname: "Watch a Video",
    image: "assets/dashpics/youtube.jpg",
    link: "https://www.youtube.com",
  ),
  MyDash(
    artname: "Research on Geeks",
    image: "assets/dashpics/GeeksforGeeks.jpg",
    link: "https://www.geeksforgeeks.org",
  ),
  MyDash(
    artname: "Get Assistance",
    image: "assets/dashpics/comet.jpg",
    link: "https://www.perplexity.ai",
  ),
  MyDash(
    artname: "Explore GitHub",
    image: "assets/dashpics/github.jpg",
    link: "https://github.com",
  ),
];
