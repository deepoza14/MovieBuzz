// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'custom_image.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery(
      {super.key,
      required this.images,
      this.number,
      this.repeat = false,
      this.isFileImage = false});

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
  final List<dynamic> images;
  final int? number;
  final bool repeat, isFileImage;
}

class _ImageGalleryState extends State<ImageGallery> {
  // List<dynamic> images;
  // _ImageGalleryState({required this.images});
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    if (widget.number != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (controller.hasClients) {
          controller.animateToPage(widget.number!,
              curve: Curves.ease, duration: const Duration(milliseconds: 500));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Images',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white,
              ),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            PageView.builder(
              allowImplicitScrolling: false,
              pageSnapping: true,
              controller: controller,
              itemCount: widget.repeat ? null : widget.images.length,
              physics: widget.images.length > 1
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InteractiveViewer(
                  child: widget.isFileImage
                      ? Image.file(widget.images[index % widget.images.length])
                      : CustomImage(
                          path:
                              "${widget.images[index % widget.images.length]}",
                        ),
                );
              },
            ),
            if (widget.images.length > 1)
              Positioned(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Container(
                      height: 70,
                      width: 50,
                      color: Colors.grey.withOpacity(0.5),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.images.length > 1)
              Positioned(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Container(
                      height: 70,
                      width: 50,
                      color: Colors.grey.withOpacity(0.5),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
