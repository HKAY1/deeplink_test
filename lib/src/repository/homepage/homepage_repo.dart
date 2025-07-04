import 'package:dio/dio.dart';
import 'package:inshort_test/db/video_table_service.dart';
import 'package:inshort_test/src/repository/homepage/homepage_contract.dart';
import 'package:inshort_test/src/repository/homepage/model/video_model.dart';

import 'package:inshort_test/src/utilities/export.dart';

final class HomepageRepo implements HomePageContract {
  HomepageRepo._();
  static final HomepageRepo instance = HomepageRepo._();
  // final Dio _dio = ApiClient.instance.getClient;
  final repo = VideoTableService.instance;

  final result = [
    {
      "adult": 0,
      "backdrop_path": "/ybBIIzDL1B9yH8OVFav81JTZmoN.jpg",
      "id": 1233069,
      "original_language": "de",
      "original_title": "Exterritorial",
      "overview":
          "When her son vanishes inside a US consulate, ex-special forces soldier Sara does everything in her power to find him — and uncovers a dark conspiracy.",
      "popularity": 567.4906,
      "poster_path": "/qWTfHG8KdXwr0bqypYbNZLenh0J.jpg",
      "release_date": "2025-04-29",
      "title": "Exterritorial",
      "video": 0,
      "vote_average": 6.952,
      "vote_count": 62,
    },
    {
      "adult": 0,
      "backdrop_path": "/fTrQsdMS2MUw00RnzH0r3JWHhts.jpg",

      "id": 1197306,
      "original_language": "en",
      "original_title": "A Working Man",
      "overview":
          "Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss's daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.",
      "popularity": 512.3196,
      "poster_path": "/xUkUZ8eOnrOnnJAfusZUqKYZiDu.jpg",
      "release_date": "2025-03-26",
      "title": "A Working Man",
      "video": 0,
      "vote_average": 6.498,
      "vote_count": 544,
    },
    {
      "adult": 0,
      "backdrop_path": "/44YfHklKam8COMUxDZop2Lnp0CS.jpg",

      "id": 668489,
      "original_language": "en",
      "original_title": "Havoc",
      "overview":
          "When a drug heist swerves lethally out of control, a jaded cop fights his way through a corrupt city's criminal underworld to save a politician's son.",
      "popularity": 521.8143,
      "poster_path": "/r46leE6PSzLR3pnVzaxx5Q30yUF.jpg",
      "release_date": "2025-04-24",
      "title": "Havoc",
      "video": 0,
      "vote_average": 6.628,
      "vote_count": 437,
    },
    {
      "adult": 0,
      "backdrop_path": "/2Nti3gYAX513wvhp8IiLL6ZDyOm.jpg",

      "id": 950387,
      "original_language": "en",
      "original_title": "A Minecraft Movie",
      "overview":
          "Four misfits find themselves struggling with ordinary problems when they are suddenly pulled through a mysterious portal into the Overworld: a bizarre, cubic wonderland that thrives on imagination. To get back home, they'll have to master this world while embarking on a magical quest with an unexpected, expert crafter, Steve.",
      "popularity": 406.2532,
      "poster_path": "/iPPTGh2OXuIv6d7cwuoPkw8govp.jpg",
      "release_date": "2025-03-31",
      "title": "A Minecraft Movie",
      "video": 0,
      "vote_average": 6.2,
      "vote_count": 799,
    },

    {
      "adult": 0,
      "backdrop_path": "/kFXtAwJYbRTqiyQpE9kDc8qEP3X.jpg",

      "id": 1225915,
      "original_language": "hi",
      "original_title": "ज्वेल थीफ: द हीस्ट बिगिन्स",
      "overview":
          "In this high-octane battle of wits and wills, ingenious con artist Rehan devises a diamond heist while trying to outsmart Rajan, his sadistic adversary.",
      "popularity": 310.7176,
      "poster_path": "/eujLbO0kf1eqWC8XpHUJdtAVW2J.jpg",
      "release_date": "2025-04-25",
      "title": "Jewel Thief: The Heist Begins",
      "video": 0,
      "vote_average": 7.2,
      "vote_count": 25,
    },
    {
      "adult": 0,
      "backdrop_path": "/rthMuZfFv4fqEU4JVbgSW9wQ8rs.jpg",

      "id": 986056,
      "original_language": "en",
      "original_title": "Thunderbolts*",
      "overview":
          "After finding themselves ensnared in a death trap, seven disillusioned castoffs must embark on a dangerous mission that will force them to confront the darkest corners of their pasts.",
      "popularity": 303.4944,
      "poster_path": "/hqcexYHbiTBfDIdDWxrxPtVndBX.jpg",
      "release_date": "2025-04-30",
      "title": "Thunderbolts*",
      "video": 0,
      "vote_average": 7.6,
      "vote_count": 251,
    },
    {
      "adult": 0,
      "backdrop_path": "/op3qmNhvwEvyT7UFyPbIfQmKriB.jpg",
      "id": 324544,
      "original_language": "en",
      "original_title": "In the Lost Lands",
      "overview":
          "A queen sends the powerful and feared sorceress Gray Alys to the ghostly wilderness of the Lost Lands in search of a magical power, where she and her guide, the drifter Boyce, must outwit and outfight both man and demon.",
      "popularity": 262.45,
      "poster_path": "/dDlfjR7gllmr8HTeN6rfrYhTdwX.jpg",
      "release_date": "2025-02-27",
      "title": "In the Lost Lands",
      "video": 0,
      "vote_average": 6.302,
      "vote_count": 318,
    },
    {
      "adult": 0,
      "backdrop_path": "/jhL4eTpccoZSVehhcR8DKLSBHZy.jpg",

      "id": 822119,
      "original_language": "en",
      "original_title": "Captain America: Brave New World",
      "overview":
          "After meeting with newly elected U.S. President Thaddeus Ross, Sam finds himself in the middle of an international incident. He must discover the reason behind a nefarious global plot before the true mastermind has the entire world seeing red.",
      "popularity": 260.3523,
      "poster_path": "/pzIddUEMWhWzfvLI3TwxUG2wGoi.jpg",
      "release_date": "2025-02-12",
      "title": "Captain America: Brave New World",
      "video": 0,
      "vote_average": 6.2,
      "vote_count": 1701,
    },
    {
      "adult": 0,
      "backdrop_path": "/bFmziv84NfEVEGTK8c6EVY3bxve.jpg",

      "id": 1180906,
      "original_language": "en",
      "original_title": "Desert Dawn",
      "overview":
          "A newly appointed small-town sheriff and his begrudging deputy get tangled up in a web of lies and corruption involving shady businessmen and the cartel while investigating the murder of a mysterious woman.",
      "popularity": 224.4353,
      "poster_path": "/S21BfLrJSD9njucBfY3CKqp8rD.jpg",
      "release_date": "2025-05-15",
      "title": "Desert Dawn",
      "video": 0,
      "vote_average": 0.0,
      "vote_count": 0,
    },
    {
      "adult": 0,
      "backdrop_path": "/Zes06xI18u47pblwRGTtqRm0R8.jpg",

      "id": 1276073,
      "original_language": "ja",
      "original_title": "新幹線大爆破",
      "overview":
          "When panic erupts on a Tokyo-bound bullet train that will explode if it slows below 100 kph, authorities race against time to save everyone on board.",
      "popularity": 198.3822,
      "poster_path": "/uxYMN7egzwU9dQWmlm9tVTVpBbe.jpg",
      "release_date": "2025-04-23",
      "title": "Bullet Train Explosion",
      "video": 0,
      "vote_average": 6.887,
      "vote_count": 128,
    },
    {
      "adult": 0,
      "backdrop_path": "/hdHIjZxq3SWFqpAz4NFhdbud0iz.jpg",

      "id": 348,
      "original_language": "en",
      "original_title": "Alien",
      "overview":
          "During its return to the earth, commercial spaceship Nostromo intercepts a distress signal from a distant planet. When a three-member team of the crew discovers a chamber containing thousands of eggs on the planet, a creature inside one of the eggs attacks an explorer. The entire crew is unaware of the impending nightmare set to descend upon them when the alien parasite planted inside its unfortunate host is birthed.",
      "popularity": 191.1943,
      "poster_path": "/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg",
      "release_date": "1979-05-25",
      "title": "Alien",
      "video": 0,
      "vote_average": 8.163,
      "vote_count": 15243,
    },
    {
      "adult": 0,
      "backdrop_path": "/6dC7ULfiutxwEAs7LjWHL2Tc7Zv.jpg",

      "id": 1124620,
      "original_language": "en",
      "original_title": "The Monkey",
      "overview":
          "When twin brothers find a mysterious wind-up monkey, a series of outrageous deaths tear their family apart. Twenty-five years later, the monkey begins a new killing spree forcing the estranged brothers to confront the cursed toy.",
      "popularity": 210.7599,
      "poster_path": "/yYa8Onk9ow7ukcnfp2QWVvjWYel.jpg",
      "release_date": "2025-02-14",
      "title": "The Monkey",
      "video": 0,
      "vote_average": 5.888,
      "vote_count": 555,
    },
    {
      "adult": 0,
      "backdrop_path": "/eDBZN0TbWkxoAB0qIDFagVcPPTN.jpg",

      "id": 1153714,
      "original_language": "en",
      "original_title": "Death of a Unicorn",
      "overview":
          "A father and daughter accidentally hit and kill a unicorn while en route to a weekend retreat, where his billionaire boss seeks to exploit the creature’s miraculous curative properties.",
      "popularity": 220.9381,
      "poster_path": "/lXR32JepFwD1UHkplWqtBP1K79z.jpg",
      "release_date": "2025-03-27",
      "title": "Death of a Unicorn",
      "video": 0,
      "vote_average": 6.197,
      "vote_count": 117,
    },
    {
      "adult": 0,
      "backdrop_path": "/1hBtO9tXP60IFBZD27OsbaBmxs5.jpg",

      "id": 1414048,
      "original_language": "en",
      "original_title": "Day of Reckoning",
      "overview":
          "Put-upon lawman John Dorsey is on the verge of losing his wife and his job as sheriff, so he posses up with bullish U.S. Marshall Butch Hayden to hold outlaw Emily Rusk hostage. A battle of wills ensues as Emily turns the posse on themselves, but as her marauding husband and his gang approach, Emily and John realize they will need each other to survive.",
      "popularity": 222.8271,
      "poster_path": "/cVSjSQryFUERYSdOmdgJ2m0eBte.jpg",
      "release_date": "2025-03-28",
      "title": "Day of Reckoning",
      "video": 0,
      "vote_average": 6.583,
      "vote_count": 12,
    },
    {
      "adult": 0,
      "backdrop_path": "/oUgVgGaNqV9Y0Zdyjc1kCpzIe4G.jpg",

      "id": 1233413,
      "original_language": "en",
      "original_title": "Sinners",
      "overview":
          "Trying to leave their troubled lives behind, twin brothers return to their hometown to start again, only to discover that an even greater evil is waiting to welcome them back.",
      "popularity": 209.6099,
      "poster_path": "/jYfMTSiFFK7ffbY2lay4zyvTkEk.jpg",
      "release_date": "2025-04-16",
      "title": "Sinners",
      "video": 0,
      "vote_average": 7.653,
      "vote_count": 512,
    },
    {
      "adult": 0,
      "backdrop_path": "/svLj9iyRmmeNVRsMreANn7DPPZE.jpg",

      "id": 1356236,
      "original_language": "en",
      "original_title": "Saint Catherine",
      "overview":
          "An orphaned girl is rescued from a satanic ritual and taken to Saint Catherine Institute for homeless youth. There she will learn new skills while facing demons that stalk her.",
      "popularity": 206.1029,
      "poster_path": "/hBJdzKPeDaC96AzlrtMWBomYSZV.jpg",
      "release_date": "2025-04-11",
      "title": "Saint Catherine",
      "video": 0,
      "vote_average": 6.273,
      "vote_count": 11,
    },
    {
      "adult": 0,
      "backdrop_path": "/bMdSmfI0qwpAkvhAL7sqpjmwgf4.jpg",

      "id": 335984,
      "original_language": "en",
      "original_title": "Blade Runner 2049",
      "overview":
          "Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what's left of society into chaos. K's discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years.",
      "popularity": 169.6748,
      "poster_path": "/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg",
      "release_date": "2017-10-04",
      "title": "Blade Runner 2049",
      "video": 0,
      "vote_average": 7.579,
      "vote_count": 14087,
    },
    {
      "adult": 0,
      "backdrop_path": "/ddIkmH3TpR6XSc47jj0BrGK5Rbz.jpg",

      "id": 374720,
      "original_language": "en",
      "original_title": "Dunkirk",
      "overview":
          "The story of the miraculous evacuation of Allied soldiers from Belgium, Britain, Canada and France, who were cut off and surrounded by the German army from the beaches and harbour of Dunkirk between May 26th and June 4th 1940 during World War II.",
      "popularity": 178.6189,
      "poster_path": "/b4Oe15CGLL61Ped0RAS9JpqdmCt.jpg",
      "release_date": "2017-07-19",
      "title": "Dunkirk",
      "video": 0,
      "vote_average": 7.45,
      "vote_count": 16764,
    },
    {
      "adult": 0,
      "backdrop_path": "/aPEhtVLrZRnJufKHwbHgqwirv7J.jpg",

      "id": 297762,
      "original_language": "en",
      "original_title": "Wonder Woman",
      "overview":
          "An Amazon princess comes to the world of Man in the grips of the First World War to confront the forces of evil and bring an end to human conflict.",
      "popularity": 163.5866,
      "poster_path": "/v4ncgZjG2Zu8ZW5al1vIZTsSjqX.jpg",
      "release_date": "2017-05-30",
      "title": "Wonder Woman",
      "video": 0,
      "vote_average": 7.216,
      "vote_count": 20190,
    },

    {
      "adult": 0,
      "backdrop_path": "/1AWjIUgbZYaKbwUH5qoJaKCcRkf.jpg",

      "id": 1471014,
      "original_language": "en",
      "original_title": "Van Gogh by Vincent",
      "overview":
          "In a career that lasted only ten years, Vincent Van Gogh painted one subject more than any other: himself. This is the story of Vincent told using eight of his most iconic self-portraits.",
      "popularity": 461.9303,
      "poster_path": "/z73X4WKZghBh5fri31o8P6vBEB2.jpg",
      "release_date": "2025-03-26",
      "title": "Van Gogh by Vincent",
      "video": 0,
      "vote_average": 6.409,
      "vote_count": 11,
    },

    {
      "adult": 0,
      "backdrop_path": "/2CcMG34v4PCynvxwmBUwVtNqsKL.jpg",

      "id": 1249213,
      "original_language": "en",
      "original_title": "Drop",
      "overview":
          "Violet, a widowed mother on her first date in years, arrives at an upscale restaurant where she is relieved that her date, Henry, is more charming and handsome than she expected. But their chemistry begins to curdle as Violet begins being irritated and then terrorized by a series of anonymous drops to her phone.",
      "popularity": 148.0823,
      "poster_path": "/dS2S5lpfgRIRQOb7LDCjNsQqKjp.jpg",
      "release_date": "2025-04-10",
      "title": "Drop",
      "video": 0,
      "vote_average": 6.613,
      "vote_count": 216,
    },
    {
      "adult": 0,
      "backdrop_path": "/sQa299yggIkxfwKJFgzYwDdsC9t.jpg",

      "id": 931349,
      "original_language": "en",
      "original_title": "Ash",
      "overview":
          "A woman wakes up on a distant planet and finds the crew of her space station viciously killed. Her investigation into what happened sets in motion a terrifying chain of events.",
      "popularity": 115.8281,
      "poster_path": "/5Oz39iyRuztiA8XqCNVDBuy2Ut3.jpg",
      "release_date": "2025-03-20",
      "title": "Ash",
      "video": 0,
      "vote_average": 5.392,
      "vote_count": 166,
    },
    {
      "adult": 0,
      "backdrop_path": "/1YMrOtrW7b4pL2lfD8UciZPOJGs.jpg",

      "id": 974576,
      "original_language": "en",
      "original_title": "Conclave",
      "overview":
          "After the unexpected death of the Pope, Cardinal Lawrence is tasked with managing the covert and ancient ritual of electing a new one. Sequestered in the Vatican with the Catholic Church’s most powerful leaders until the process is complete, Lawrence finds himself at the center of a conspiracy that could lead to its downfall.",
      "popularity": 118.9836,
      "poster_path": "/l4WXg5oQPK6GVlISKQNIUGb8rKJ.jpg",
      "release_date": "2024-10-25",
      "title": "Conclave",
      "video": 0,
      "vote_average": 7.21,
      "vote_count": 2219,
    },

    {
      "adult": 0,
      "backdrop_path": "/rdxdvXQGqCj2Vb7SvTL8gdxlSzI.jpg",

      "id": 870028,
      "original_language": "en",
      "original_title": "The Accountant²",
      "overview":
          "When an old acquaintance is murdered, Wolff is compelled to solve the case. Realizing more extreme measures are necessary, Wolff recruits his estranged and highly lethal brother, Brax, to help. In partnership with Marybeth Medina, they uncover a deadly conspiracy, becoming targets of a ruthless network of killers who will stop at nothing to keep their secrets buried.",
      "popularity": 119.2236,
      "poster_path": "/kMDUS7VmFhb2coRfVBoGLR8ADBt.jpg",
      "release_date": "2025-04-23",
      "title": "The Accountant²",
      "video": 0,
      "vote_average": 7.216,
      "vote_count": 104,
    },
    {
      "adult": 0,
      "backdrop_path": "/k32XKMjmXMGeydykD32jfER3BVI.jpg",

      "id": 1045938,
      "original_language": "en",
      "original_title": "G20",
      "overview":
          "After the G20 Summit is overtaken by terrorists, President Danielle Sutton must bring all her statecraft and military experience to defend her family and her fellow leaders.",
      "popularity": 122.1197,
      "poster_path": "/wv6oWAleCJZUk5htrGg413t3GCy.jpg",
      "release_date": "2025-04-09",
      "title": "G20",
      "video": 0,
      "vote_average": 6.587,
      "vote_count": 426,
    },
  ];

  @override
  Future<List<VideoModel>> fetchNowPlaying() async {
    try {
      final res = await repo.getAllNowPlayingMovies();
      return res;
    } on AppError catch (e) {
      Log.error('DioException: ${e.message}');
      rethrow;
    } on DioException catch (e) {
      Log.error('DioException: ${e.message}');
      rethrow;
    }
  }

  @override
  Future<List<VideoModel>> fetchTrending() async {
    try {
      final res = await repo.getAllTrendingMovies();

      return res;
    } on AppError catch (_) {
      rethrow;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> fetchVideos() async {
    try {
      await repo.truncate();
      await repo.bulkInsertMovies(videos: result);
    } on AppError catch (_) {
      rethrow;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> addBookMark({
    required int id,
    required bool isBookMarked,
  }) async {
    try {
      await repo.bookMarkMovie(id: id, isBookMarked: isBookMarked);
    } on AppError catch (_) {
      rethrow;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
