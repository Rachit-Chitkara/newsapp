import 'package:newz/Backend/fetchNewsPages.dart';

// class Content {
//   static Future<List> content;
//   static void API(int n) {
//     if (n == 1) {
//       content = fetchTechNews();
//     } else if (n == 2) {
//       content = fetchGeneralNews();
//     } else if (n == 3) {
//       content = fetchHealthNews();
//     } else if (n == 4) {
//       content = fetchBizNews();
//     } else if (n == 5) {
//       content = fetchSportsNews();
//     } else if (n == 6) {
//       content = fetchScienceNews();
//     }
//   }
// }
class Content {
  static String topic;
  static void API(int n) {
    if (n == 1) {
      topic = 'technology';
    } else if (n == 2) {
      topic = 'general';
    } else if (n == 3) {
      topic = 'health';
    } else if (n == 4) {
      topic = 'business';
    } else if (n == 5) {
      topic = 'sports';
    } else if (n == 6) {
      topic = 'science';
    }
  }
}
