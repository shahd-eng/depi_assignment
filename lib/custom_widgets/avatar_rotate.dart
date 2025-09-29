import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';

class AvatarRotate extends StatefulWidget {
  const AvatarRotate({super.key});

  @override
  State<AvatarRotate> createState() => _AvatarRotateState();
}

class _AvatarRotateState extends State<AvatarRotate> with SingleTickerProviderStateMixin{
  File? _imageFile;
  late AnimationController _controller;
  @override
  void initState() {
   _controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    super.initState();
  }
  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }
  Future<void>pickImage()async
  {
    ImagePicker picker=ImagePicker();
   final pickedImage=await picker.pickImage(source:ImageSource.gallery);
   if(pickedImage!=null)
     {
       setState(() {
         _imageFile = File(pickedImage.path);

       });
       _controller.forward(from: 0);

     }
  }
  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: pickImage,
      child: RotationTransition(
          turns: Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _controller, curve:Curves.easeOutBack)),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: AppColors.mainColor,
        backgroundImage: _imageFile!=null? FileImage(_imageFile!):null,
        child: _imageFile == null
            ? const Icon(Icons.person, size: 50, color: Colors.white)
            : null,
      ),),

    );
  }
}
