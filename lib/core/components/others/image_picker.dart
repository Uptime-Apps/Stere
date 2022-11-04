import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/others.dart';
import '../../constants/radius_values.dart';
import '../../constants/spacing_values.dart';

class StereImagePicker extends StatefulWidget {
  const StereImagePicker({
    Key? key,
    required this.onImageObtained,
    required this.height,
    this.header,
    this.extraIconButtons,
  }) : super(key: key);
  final Function(File?) onImageObtained;
  final double height;
  final List<IconButton>? extraIconButtons;
  final Widget? header;

  @override
  State<StereImagePicker> createState() => _StereImagePickerState();
}

class _StereImagePickerState extends State<StereImagePicker> {
  bool loading = false;
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    XFile? selected = await ImagePicker().pickImage(
      source: source,
      imageQuality: kImageQuality,
      maxHeight: kImageMaxHeight,
      maxWidth: kImageMaxWidth,
    );
    if (selected == null) return;
    setState(() {
      _imageFile = File(selected.path);
      widget.onImageObtained(_imageFile);
    });
  }

  void _clear() => setState(() => _imageFile = null);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    final actionButtonColor = colorScheme.secondary;
    return Card(
      elevation: 1,
      color: colorScheme.surfaceVariant,
      child: Column(
        children: [
          if (widget.header != null) ...buildHeader(),
          (_imageFile == null) ? noImage(colorScheme) : hasImage(),
          Padding(
            padding: const EdgeInsets.only(bottom: kSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  icon: const Icon(Icons.image_search),
                  onPressed: () => _pickImage(ImageSource.gallery),
                  color: actionButtonColor,
                ),
                IconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: () => _pickImage(ImageSource.camera),
                  color: actionButtonColor,
                ),
                ...?widget.extraIconButtons,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hasImage() {
    final img = Image.file(
      _imageFile!,
      fit: BoxFit.cover,
      height: widget.height,
      width: double.infinity,
    );
    return (widget.header == null)
        ? ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(kCardRadius),
              topRight: Radius.circular(kCardRadius),
            ),
            child: img,
          )
        : img;
  }

  Widget noImage(ColorScheme colorScheme) => Icon(
        Icons.image,
        color: colorScheme.secondary,
        size: widget.height,
      );

  List<Widget> buildHeader() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: kSpacing),
        child: widget.header!,
      ),
    ];
  }
}
