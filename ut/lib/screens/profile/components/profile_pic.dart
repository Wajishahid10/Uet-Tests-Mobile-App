import 'dart:convert';

import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: CircleAvatar(
        backgroundImage: MemoryImage(
          (base64Decode(
            image,
          )),
        ),
      ),
    );
  }
}

/**
 
  Widget buildProfilePic() {
    final ImagePicker _picker = ImagePicker();
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: PopupMenuButton(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.camera_alt),
                ),
                elevation: 20,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera,
                        ),
                        Text("Camera"),
                      ],
                    ),
                    value: 1,
                    onTap: () async {
                      image =
                          await _picker.pickImage(source: ImageSource.camera);
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_album,
                        ),
                        Text("Gallery"),
                      ],
                    ),
                    value: 2,
                    onTap: () async {
                      image =
                          await _picker.pickImage(source: ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
 */
