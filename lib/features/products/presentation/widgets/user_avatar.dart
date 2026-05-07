
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;

  const UserAvatar({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 40,
        height: 40,
        color: AppColors.darkGrey,
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? "",
          fit: BoxFit.cover,
          placeholder: (context, url) => const UserAvatarShimmer(),
          errorWidget: (context, url, error) => const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class UserAvatarShimmer extends StatelessWidget {
  const UserAvatarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withValues(alpha: 0.25),
      highlightColor: Colors.grey.withValues(alpha: 0.1),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}