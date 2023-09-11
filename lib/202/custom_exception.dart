// exception manager'dan turetemeyiz. Bunlari sadece implements'le kullanabilirlz.
// Yani excepsion'in butun ozelliklerini aldim buarad kullaniyoum.

// exxception'i kendime gore ozellestirdim.
class FileDownloadException implements Exception {
  @override
  String toString() {
    return 'File download has failed.';
  }
}
