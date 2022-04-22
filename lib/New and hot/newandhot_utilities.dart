import 'package:flutter/material.dart';
import 'package:netflix_ui/API/tmdb_links.dart';
import 'package:netflix_ui/New%20and%20hot/newandhotutilities2.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          '🍿 Coming Soon',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return CustomContainerofComingSoon(
              index: index,
            );
          },
          itemCount: 20,
        )
      ],
    );
  }
}

class CustomContainerofComingSoon extends StatelessWidget {
  final int index;
  const CustomContainerofComingSoon({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(dateOFComingSoon[index].month,
                        style: const TextStyle(color: Colors.white54)),
                    Text('${dateOFComingSoon[index].date}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          comImg[index].url,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.network(
                          comTitleImg[index].url,
                          height: 55,
                        ),
                        Container(
                          transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: const [
                                  Icon(
                                    Icons.notifications_none_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Remind Me',
                                    style: TextStyle(fontSize: 8),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Info',
                                    style: TextStyle(fontSize: 8),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Season 1 Coming April 15',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          comTitle[index].title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 330,
                          child: Text(
                            comDesc[index].desc,
                            style: const TextStyle(
                                color: Colors.white54, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          comCate[index].cate,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ComingSoonWidgets extends StatelessWidget {
  const ComingSoonWidgets({
    Key? key,
    required this.width,
    required this.date,
    required this.day,
    required this.imageURL,
    required this.comingSoonDate,
    required this.movieName,
    required this.movieDescription,
  }) : super(key: key);

  final double width;
  final String date;
  final String day;
  final String imageURL;
  final String comingSoonDate;
  final String movieName;
  final String movieDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: width - 55,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${TMDB.imageId}$imageURL',
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: 180,
                  ),
                  const Positioned(
                    right: 20,
                    top: 150,
                    child: Icon(
                      Icons.volume_off_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  VideoListAvatarButton(
                    icon: Icons.add_alert_outlined,
                    title: 'Remind Me',
                    onPressed: () {},
                  ),
                  VideoListAvatarButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                    onPressed: () {},
                  ),
                ],
              ),
              // kVerticalSpace,
              Text(
                comingSoonDate,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                movieName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        movieDescription,
                        style: const TextStyle(overflow: TextOverflow.fade),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class EveryOneWatch extends StatelessWidget {
  const EveryOneWatch({
    Key? key,
    required this.width,
    required this.date,
    required this.day,
    required this.imageURL,
    required this.comingSoonDate,
    required this.movieName,
    required this.movieDescription,
  }) : super(key: key);

  final double width;
  final String date;
  final String day;
  final String imageURL;
  final String comingSoonDate;
  final String movieName;
  final String movieDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: width - 20,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            '${TMDB.imageId}$imageURL',
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: 180,
                    ),
                    const Positioned(
                      right: 20,
                      top: 150,
                      child: Icon(
                        Icons.volume_off_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    VideoListAvatarButton(
                      icon: Icons.send,
                      title: 'Share',
                      onPressed: () {},
                    ),
                    VideoListAvatarButton(
                      icon: Icons.add,
                      title: 'My List',
                      onPressed: () {},
                    ),
                    VideoListAvatarButton(
                      icon: Icons.play_arrow,
                      title: 'Play',
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movieName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieDescription,
                          style: const TextStyle(overflow: TextOverflow.fade),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopTen extends StatelessWidget {
  const TopTen({
    Key? key,
    required this.width,
    required this.date,
    required this.index,
    required this.day,
    required this.imageURL,
    required this.comingSoonDate,
    required this.movieName,
    required this.movieDescription,
  }) : super(key: key);

  final double width;
  final String date;
  final String day;
  final String imageURL;
  final String comingSoonDate;
  final String movieName;
  final String movieDescription;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$index',
                  style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width - 75,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            '${TMDB.imageId}$imageURL',
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: 180,
                    ),
                    const Positioned(
                      right: 20,
                      top: 150,
                      child: Icon(
                        Icons.volume_off_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    VideoListAvatarButton(
                      icon: Icons.send,
                      title: 'Share',
                      onPressed: () {},
                    ),
                    VideoListAvatarButton(
                      icon: Icons.add,
                      title: 'My List',
                      onPressed: () {},
                    ),
                    VideoListAvatarButton(
                      icon: Icons.play_arrow,
                      title: 'Play',
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movieName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieDescription,
                          style: const TextStyle(overflow: TextOverflow.fade),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoListAvatarButton extends StatelessWidget {
  const VideoListAvatarButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        children: [
          IconButton(
            icon: Icon(icon),
            color: Colors.white,
            onPressed: onPressed,
            iconSize: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
