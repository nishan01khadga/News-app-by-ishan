import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;

  const ArticleWidget({
    Key? key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 10, top: 10),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          _buildImage(context),
          _buildTitleAndDescription(),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article?.urlToImage ?? '',
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const CupertinoActivityIndicator(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              article?.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  article?.description ?? '',
                  maxLines: 2,
                ),
              ),
            ),
            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  article?.publishedAt ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}










// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/features/domain/entities/article.dart';
//
// class ArticleWidget extends StatelessWidget {
//   final ArticleEntity ? article;
//
//   const ArticleWidget({
//     Key ? key,
//     this.article,
//   }):super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsetsDirectional.only(start:14,end: 14,bottom: 10,top: 10,),
//       height: MediaQuery.of(context).size.width/2.2,
//       child: Row(
//       children: [
//         _buildImage(context),
//         _buildTitleAndDescription(),
//       ],
//       )
//     );
//   }
//   Widget _buildImage(BuildContext context){
//     return CachedNetworkImage(
//       imageUrl:article!urlToImage!,
//       imageBuilder:(context,imageProvider)=>Padding(
//         padding: const EdgeInsetsDirectional.only(end: 14),
//       child:  ClipRRect(
//         borderRadius: BorderRadius.circular(20.0),
//         child: Container(
//           width: MediaQuery.of(context).size.width/3,
//           height: double.maxFinite,
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.08),
//             image: DecorationImage(
//               image: imageProvider,
//               fit: BoxFit.cover
//             )
//           ),
//         ),
//       ),
//       ),
//       progressIndicatorBuilder:(context,url,downloadProgress )=>Padding(
//          padding:const EdgeInsetsDirectional.only(end:14),
//          child:ClipRRect(
//          borderRadius: BorderRadius.circular(20.0),
//           child: Container(
//           width: MediaQuery.of(context).size.width/3,
//           height: double.maxFinite,
//             child: const CupertinoActivityIndicator(),
//             decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.08 )
//             ),
//           ),
//          ),
//       ),
//       errorWidget:(context,url,error)=>
//           Padding(padding: const EdgeInsetsDirectional.only(end: 14),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20.0),
//               child: Container(
//                 width: MediaQuery.of(context).size.width/3,
//                 height: double.maxFinite,
//                 child: const Icon(Icons.error),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.08),
//                 ),
//               ),
//             ),
//             ),
//     );
//   }
//   Widget _buildTitleAndDescription() {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 7),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title
//             Text(
//               article!.title ?? '',
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Butler',
//                 fontWeight: FontWeight.w900,
//                 color: Colors.black87,
//               ),
//             ),
//             //Description
//             Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 4),
//                   child: Text(
//                     article!.description ?? '',
//                     maxLines: 2,
//                   ),
//                 )
//             ),
//             //Datetime
//             Row(
//               children: [
//                 const Icon(Icons.timeline_outlined, size: 16,),
//                 const SizedBox(width: 4,),
//                 Text(
//                   article!publishedAt!,
//                   style: const TextStyle(
//                     fontSize: 12,
//                   ),
//                 ),
//
//               ],
//             )
//           ],
//
//         ),
//       ),
//     );
//   }
// }
