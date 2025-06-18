class PostData {
  final String username;
  final String imageUrl;
  final String caption;
  final int likes;
  final int comments;
  final String timeAgo;
  final List<String> likedBy;

  PostData({
    required this.username,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.timeAgo,
    required this.likedBy,
  });
}

class PostListData {
  static List<PostData> getPosts() {
    return [
      PostData(
        username: 'ZiolesXy',
        imageUrl: 'assets/images/posts/post1.jpeg',
        caption: 'Hari yang indah untuk coding! 💻 #flutter #coding',
        likes: 1234,
        comments: 89,
        timeAgo: '2 jam yang lalu',
        likedBy: ['fahri_v07', 'Alphonse Elric'],
      ),
      PostData(
        username: 'fahri_v07',
        imageUrl: 'assets/images/posts/post2.jpeg',
        caption: 'Makan siang yang enak 😋 #foodie #lunch',
        likes: 856,
        comments: 45,
        timeAgo: '3 jam yang lalu',
        likedBy: ['ZiolesXy', 'mie ayam 😋'],
      ),
      PostData(
        username: 'Alphonse Elric',
        imageUrl: 'assets/images/posts/post1.jpeg',
        caption: 'Fullmetal Alchemist Brotherhood adalah anime terbaik! ⚡ #anime #fmab',
        likes: 2103,
        comments: 156,
        timeAgo: '5 jam yang lalu',
        likedBy: ['Vylan Drago', 'Voksi Doksi'],
      ),
      PostData(
        username: 'mie ayam 😋',
        imageUrl: 'assets/images/posts/post1.jpeg',
        caption: 'Mie ayam favoritku! 🍜 #mieayam #food',
        likes: 567,
        comments: 34,
        timeAgo: '6 jam yang lalu',
        likedBy: ['Rafif Dzaky Akmal', 'LeBron Jamet'],
      ),
      PostData(
        username: 'Rafif Dzaky Akmal',
        imageUrl: 'assets/images/posts/post5.jpeg',
        caption: 'Basketball is lifes! 🏀 #basketball #sports',
        likes: 789,
        comments: 67,
        timeAgo: '8 jam yang lalu',
        likedBy: ['SigmaGyatt', 'ZiolesXy'],
      ),
      PostData(
        username: 'Vylan Drago',
        imageUrl: 'assets/images/posts/post6.jpeg',
        caption: 'Dragon Ball adalah anime masa kecilku! 🐉 #dragonball #anime',
        likes: 1456,
        comments: 123,
        timeAgo: '10 jam yang lalu',
        likedBy: ['fahri_v07', 'Alphonse Elric'],
      ),
      PostData(
        username: 'Voksi Doksi',
        imageUrl: 'assets/images/posts/post7.jpeg',
        caption: 'Coding sambil dengerin musik 🎵 #coding #music',
        likes: 432,
        comments: 28,
        timeAgo: '12 jam yang lalu',
        likedBy: ['mie ayam 😋', 'Rafif Dzaky Akmal'],
      ),
      PostData(
        username: 'LeBron Jamet',
        imageUrl: 'assets/images/posts/post8.jpeg',
        caption: 'Basketball practice! 💪 #basketball #practice',
        likes: 987,
        comments: 76,
        timeAgo: '1 hari yang lalu',
        likedBy: ['Vylan Drago', 'Voksi Doksi'],
      ),
      PostData(
        username: 'SigmaGyatt',
        imageUrl: 'assets/images/posts/post9.jpeg',
        caption: 'Gaming time! 🎮 #gaming #gamer',
        likes: 654,
        comments: 43,
        timeAgo: '1 hari yang lalu',
        likedBy: ['LeBron Jamet', 'SigmaGyatt'],
      ),
      PostData(
        username: 'ZiolesXy',
        imageUrl: 'assets/images/posts/post10.jpeg',
        caption: 'Another day, another code! 💻 #coding #programming',
        likes: 876,
        comments: 65,
        timeAgo: '2 hari yang lalu',
        likedBy: ['fahri_v07', 'Alphonse Elric'],
      ),
    ];
  }
} 