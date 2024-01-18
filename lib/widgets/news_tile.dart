import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_try/models/artical_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.articalModel});
  final ArticalModel articalModel;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Builder(
            builder: (context) {
              try {
                return CachedNetworkImage(
                  imageUrl: widget.articalModel.image ??
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              } catch (e) {
                if (e is SocketException) {
                  // Handle the SocketException by displaying a placeholder or an error message
                  return Image.asset(
                    'assets/technology.jpeg', // Replace with your placeholder image asset
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                } else {
                  // Handle other exceptions here
                  return const Text('Error loading image');
                }
              }
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),

        InkWell(
          onTap: () {
            setState(() {
              _isPressed = !_isPressed; // Toggle the pressed state
            });
            if (widget.articalModel.URL != null &&
                widget.articalModel.URL.isNotEmpty) {
              launchUrl(
                Uri.parse(widget.articalModel.URL),
                mode: LaunchMode.inAppWebView,
              );
            }
          },
          child: Text(
            widget.articalModel.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              color: _isPressed ? Colors.purple : Colors.grey,
            ),
          ),
        ),
        Text(
          widget.articalModel.subtitle ?? 'their is Error',
          maxLines: 2,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
