import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class YemenMarketImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholderPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  
  const YemenMarketImage({
    super.key,
    this.imageUrl,
    this.placeholderPath = 'assets/images/products/placeholder.png',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });
  
  @override
  Widget build(BuildContext context) {
    final image = imageUrl != null && imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            width: width,
            height: height,
            fit: fit,
            placeholder: (context, url) => _buildPlaceholder(),
            errorWidget: (context, url, error) => _buildPlaceholder(),
          )
        : _buildPlaceholder();
    
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }
    
    return image;
  }
  
  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.storefront,
              size: width != null ? width! * 0.3 : 40,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              '🇾🇪 Yemen Market',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: width != null ? width! * 0.05 : 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
