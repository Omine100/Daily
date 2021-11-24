// List<Image> _images = [
//   Image(image: AssetImage("lib/assets/home/home_carouselOne.png")),
//   Image(image: AssetImage("lib/assets/home/home_carouselTwo.png")),
//   Image(image: AssetImage("lib/assets/home/home_carouselThree.png")),
//   Image(image: AssetImage("lib/assets/home/home_carouselFour.png")),
//   Image(image: AssetImage("lib/assets/home/home_carouselFive.png")),
// ];
// Widget authProfilePicker(BuildContext context, State state) {
//   return GestureDetector(
//     onTap: () {
//       UserIStandards().mediaSelectionDialog(context, state).then(
//           (file) => FirebaseAccounts().setCurrentUserProfilePicImage(file));
//     },
//     child: Container(
//       height: 200,
//       width: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(60),
//         color: Colors.red.shade200,
//       ),
//       child: _images[Random().nextInt(_images.length)],
//     ),
//   );
// }
