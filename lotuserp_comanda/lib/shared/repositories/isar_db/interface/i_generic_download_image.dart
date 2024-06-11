abstract class IGenericDownloadImage {
  Future<void> downloadImage<T>(String url, String path);
}