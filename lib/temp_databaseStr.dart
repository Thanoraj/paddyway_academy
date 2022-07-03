import 'package:cloud_firestore/cloud_firestore.dart';

Map user = {
  "123456": {
    "Name": "Thanoraj",
    "Class": "E18",
    "allowedSubjects": [
      "U1",
      "U3",
      "U5",
    ],
  }
};

Map lessons = {
  "U1": {
    'title': 'Equilibrium of a Rigid Body',
    "videos": [
      {
        'videoTitle': 'Rigid body 1',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'Skh_wTbopzk',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta luctus condimentum. Pellentesque est velit, lobortis vitae rhoncus non, dictum at quam. Vivamus varius enim vitae urna consectetur, at commodo est bibendum. Nam mattis turpis a bibendum suscipit. Mauris tristique dictum mattis. Sed aliquet massa vel lorem convallis tincidunt. Vivamus non fringilla elit, id volutpat quam. Suspendisse et finibus diam. Donec libero quam, volutpat at mattis vitae, cursus et nisi. Aenean sit amet dapibus leo. Etiam suscipit interdum rutrum. Donec ac felis metus. Duis ac gravida nisi, vel venenatis felis. Cras rutrum bibendum scelerisque. Nullam rutrum turpis vel lacus laoreet, quis tempor nisl cursus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis semper nibh consectetur, faucibus leo maximus, placerat metus. Donec volutpat lectus at mi vehicula, ut sodales odio ultricies. Nullam at turpis magna. Phasellus tellus enim, maximus at tellus sed, congue molestie elit. Integer eget purus eget nulla auctor rutrum. Nam at hendrerit odio. Aliquam erat volutpat. Nunc nec cursus libero. Cras semper nisl ac erat laoreet tristique. Nullam bibendum arcu sit amet orci ornare mollis. Ut fringilla ipsum quis elit mattis molestie. Maecenas cursus leo ac laoreet rutrum. Donec vel consequat odio, ac tristique sem. Nulla malesuada ligula quis diam convallis, non eleifend enim vehicula. Proin auctor dolor tempus, consequat arcu a, laoreet augue. Ut maximus nibh ac lobortis malesuada. Mauris elementum gravida rhoncus. In a consequat tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed rutrum quam eu hendrerit efficitur. Nam id molestie justo. Suspendisse ac urna viverra quam volutpat porta. Morbi ornare efficitur metus quis ultricies. In mattis imperdiet nisi ac mollis. Vestibulum sapien justo, facilisis vitae pellentesque vitae, vestibulum et libero. Duis vel urna sit amet libero pulvinar laoreet. Maecenas hendrerit sollicitudin massa et scelerisque. Quisque iaculis blandit neque. Duis commodo neque massa, a pulvinar est finibus ut. Vestibulum vel nisi tortor. Suspendisse iaculis, velit at iaculis ultricies, lacus quam luctus ligula, vel ultricies enim velit nec lectus. Donec ac eros ac magna convallis hendrerit. Proin in tempor justo, vitae hendrerit ante. Ut ornare elit erat, in semper sapien egestas in. Praesent eget massa luctus, ultricies velit et, accumsan enim. Donec luctus ullamcorper enim, in facilisis mauris fringilla egestas. Suspendisse nec dolor molestie, auctor erat at, facilisis odio. Maecenas imperdiet libero neque, at facilisis massa tempus in. Fusce ac sapien at lectus tempor condimentum. Morbi a lacus non odio laoreet tempor. Duis sit amet volutpat dui, scelerisque tincidunt lectus. In fermentum pharetra risus ac condimentum. Ut sapien lorem, accumsan a congue maximus, porttitor a nibh. Nulla id efficitur dolor. Morbi commodo diam et metus tincidunt placerat. Proin eu orci finibus, euismod nunc ac, maximus metus.',
        'duration': '0:17:47.000000',
        'thumbnails': 'https://img.youtube.com/vi/Skh_wTbopzk/default.jpg',
      },
      {
        'videoTitle': 'Rigid body 2',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': '85oO2LQs8go',
        'description': '',
        'duration': '0:09:49.000000',
        'thumbnails': 'https://img.youtube.com/vi/85oO2LQs8go/default.jpg',
      },
      {
        'videoTitle': 'Rigid body 3',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'Qlf-Xi4GHjE',
        'description': '',
        'duration': '0:27:45.000000',
        'thumbnails': 'https://img.youtube.com/vi/Qlf-Xi4GHjE/default.jpg',
      },
      {
        'videoTitle': 'Rigid body EPISODE 4',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': '4wcfYtGuGQw',
        'description': '',
        'duration': '0:29:48.000000',
        'keywords': '[]',
        'thumbnails': 'https://img.youtube.com/vi/4wcfYtGuGQw/default.jpg',
      },
      {
        'videoTitle': 'Rigid body EPISODE 5',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'LK8DtkoS6Rc',
        'description': '',
        'duration': '0:16:27.000000',
        'thumbnails': 'https://img.youtube.com/vi/LK8DtkoS6Rc/default.jpg',
      },
    ]
  },
  "U2": {
    'title': 'Matrices & Determinants',
    "videos": [
      {
        'videoTitle': 'Matrices & Determinants   EPISODE 01',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'Wh30nFktBQY',
        'description': '',
        'duration': '0:22:56.000000',
        'thumbnails': 'https://img.youtube.com/vi/Wh30nFktBQY/default.jpg',
      },
      {
        'videoTitle': 'Matrices & Determinants   EPISODE 02',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'c8oc6eZP-jc',
        'description': '',
        'duration': '0:25:20.000000',
        'thumbnails': 'https://img.youtube.com/vi/c8oc6eZP-jc/default.jpg',
      },
      {
        'videoTitle': 'Matrices & Determinants   EPISODE 03',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'ZCww55Lfme4',
        'description': '',
        'duration': '0:17:12.000000',
        'thumbnails': 'https://img.youtube.com/vi/ZCww55Lfme4/default.jpg',
      },
      {
        'videoTitle': 'Matrices & Determinants   EPISODE 04',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'xVWgyVdhzH8',
        'description': '',
        'duration': '0:17:41.000000',
        'thumbnails': 'https://img.youtube.com/vi/xVWgyVdhzH8/default.jpg',
      },
      {
        'videoTitle': 'Matrices & Determinants   EPISODE 05',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'CBx6l-ypYRw',
        'description': '',
        'duration': '0:14:34.000000',
        'thumbnails': 'https://img.youtube.com/vi/CBx6l-ypYRw/default.jpg',
      },
    ]
  },
  "U3": {
    'title': 'Binomial Expansion',
    'videos': [
      {
        'videoTitle': 'Binomial Expansion EPISODE  1',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'l18b2OGUs2M',
        'description': '',
        'duration': '0:18:31.000000',
        'thumbnails': 'https://img.youtube.com/vi/l18b2OGUs2M/default.jpg',
      },
      {
        'videoTitle': 'Binomial Expansion EPISODE  2',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'wqjhseIMnro',
        'description': '',
        'duration': '0:20:20.000000',
        'thumbnails': 'https://img.youtube.com/vi/wqjhseIMnro/default.jpg',
      },
      {
        'videoTitle': 'Binomial Expansion EPISODE  3',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'OfzXmHEDCDI',
        'description': '',
        'duration': '0:08:03.000000',
        'thumbnails': 'https://img.youtube.com/vi/OfzXmHEDCDI/default.jpg',
      },
      {
        'videoTitle': 'Binomial Expansion EPISODE  4',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'YVlmrRFcCAM',
        'description': '',
        'duration': '0:09:19.000000',
        'thumbnails': 'https://img.youtube.com/vi/YVlmrRFcCAM/default.jpg',
      },
      {
        'videoTitle': 'Binomial Expansion EPISODE  5',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'rsnv-LqhCWM',
        'description': '',
        'duration': '0:08:13.000000',
        'thumbnails': 'https://img.youtube.com/vi/rsnv-LqhCWM/default.jpg',
      },
    ]
  },
  "U4": {
    'title': 'Differentiation of Trigonometric Functions by First Principles',
    'videos': [
      {
        'videoTitle':
            'Differentiation of trigonometric functions by First Principles',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': '3ktwhsTuPZ8',
        'description': '',
        'duration': '0:17:10.000000',
        'thumbnails': 'https://img.youtube.com/vi/3ktwhsTuPZ8/default.jpg',
      },
      {
        'videoTitle':
            'Differentiation of Trigonometric Functions by First Principles',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'TehDm7HHxl4',
        'description': '',
        'duration': '0:09:42.000000',
        'thumbnails': 'https://img.youtube.com/vi/TehDm7HHxl4/default.jpg',
      },
    ]
  },
  "U5": {
    'title': 'Loci on argand diagram',
    'videos': [
      {
        'videoTitle': 'Loci on Argand diagram EPISODE 1',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'as0wSOKOV-Y',
        'description': '',
        'duration': '0:20:57.000000',
        'thumbnails': 'https://img.youtube.com/vi/as0wSOKOV-Y/default.jpg',
      },
      {
        'videoTitle': 'Loci on Argand Diagram EPISODE  2',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'Ol0mn5iM7FQ',
        'description': '',
        'duration': '0:15:57.000000',
        'thumbnails': 'https://img.youtube.com/vi/Ol0mn5iM7FQ/default.jpg',
      },
      {
        'videoTitle': 'Loci on Argand diagram EPISODE 3',
        'videoAuthor': 'Pantaleon Perera - Combined Mathematics Videos',
        'id': 'WofVLQEk1TM',
        'description': '',
        'duration': '0:10:22.000000',
        'thumbnails': 'https://img.youtube.com/vi/WofVLQEk1TM/default.jpg',
      },
    ]
  },
};

class DatabaseManagement {
  static changeVideoLocation() async {
    List lessons = ["U1", 'U2', 'U3', 'U4', 'U5'];
    for (String lesson in lessons) {
      List documents = [];
      List videos = [];
      await FirebaseFirestore.instance
          .collection("lessons")
          .doc(lesson)
          .get()
          .then((value) async {
        documents = value.data()!['documents'];
        videos = value.data()!['videos'];
        print(documents);
        print(videos);
        for (int i = 1; i < 7; i++) {
          await FirebaseFirestore.instance
              .collection("lessons")
              .doc(lesson)
              .collection("section$i")
              .doc("videos")
              .set({"videos": videos});
          await FirebaseFirestore.instance
              .collection("lessons")
              .doc(lesson)
              .collection("section$i")
              .doc("documents")
              .set({"documents": documents});
        }
      });
    }
  }
}
