class Audio {
  String imageLocation;
  String title;
  String author;
  String audioLocation;

  Audio(
      {required this.imageLocation,
      required this.title,
      required this.author,
      required this.audioLocation});
}

List<Audio> audioLibrary = [
  Audio(
      imageLocation: 'assets/images/001.jpg',
      title: 'Sabne tumko pukara Shree Ram ji',
      author: 'Hariharan',
      audioLocation: '001.mp3'),
  Audio(
      imageLocation: 'assets/images/002.jpg',
      title: 'Ram aayenge',
      author: 'Vishal Mishra',
      audioLocation: '002.mp3'),
  Audio(
      imageLocation: 'assets/images/003.jpg',
      title: 'Ram jai jai',
      author: 'Swara Mishra',
      audioLocation: '003.mp3')
];
