class StoryData {
  final String username;
  final String imageUrl;
  final bool isYours;

  StoryData({
    required this.username,
    required this.imageUrl,
    this.isYours = false,
  });
}

class StoryListData {
  static List<StoryData> getStories() {
    return [
      StoryData(
        username: 'Pasha',
        imageUrl: 'assets/images/people/firefly.jpeg',
        isYours: true,
      ),
      StoryData(
        username: 'ZiolesXy',
        imageUrl: 'assets/images/people/Acheron.jpeg',
      ),
      StoryData(
        username: 'fahri_v07',
        imageUrl: 'assets/images/people/tungtung.jpeg',
      ),
      StoryData(
        username: 'Alphonse Elric',
        imageUrl: 'assets/images/people/',
      ),
      StoryData(
        username: 'mie ayam 😋',
        imageUrl: 'assets/images/people/',
      ),
      StoryData(
        username: 'Rafif Dzaky Akmal',
        imageUrl: 'assets/images/people/',
      ),
      StoryData(
        username: 'Vylan Drago',
        imageUrl: 'assets/images/people/',
      ),
      StoryData(
        username: 'Voksi Doksi',
        imageUrl: 'assets/images/people/',
      ),
      StoryData(
        username: 'LeBron Jamet',
        imageUrl: 'assets/images/people/',
      ),
      StoryData(
        username: 'SigmaGyatt',
        imageUrl: 'assets/images/people/',
      ),
    ];
  }
}