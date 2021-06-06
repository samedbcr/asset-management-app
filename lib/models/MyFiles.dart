class CloudStorageInfo {
  final String svgSrc, title;
  final int numOfFiels;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.numOfFiels,
  });
}

List demoMyFiels = [
  CloudStorageInfo(
    title: "Total Assets",
    numOfFiels: 300,
    svgSrc: "assets/iconsv1/assets.svg",
  ),
  CloudStorageInfo(
    title: "Total Licenses",
    numOfFiels: 300,
    svgSrc: "assets/iconsv1/license.svg",
  ),
  CloudStorageInfo(
    title: "Total Employee",
    numOfFiels: 300,
    svgSrc: "assets/iconsv1/employee.svg",
  ),
];
