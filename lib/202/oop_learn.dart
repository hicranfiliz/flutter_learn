import 'package:flutter_learn/202/custom_exception.dart';

// amac: is yapacak katmanin iskletini olusturmak
abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  Future<void> toShare(String path) async {
    await launchUrl(path);
  }

  launchUrl(String path) {}
}

// eer ust siniin butun ozelliklerini alacagim ama ana ozelliklerini de tekrar edecegim,
// o zaman extend ediyotum. Extend edince toShare'i vermesem de oluyor.
// Çünkü özellikleri kullanacim, ama bos,ici doldurulmamis olanlari ben dolduracagim demek.
class FileDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('a');
    return true;
  }

// extend etmenin amaci o sinifin ozelliklerini alip, uzerine kendi ozelliklerimi katabilecegim kavramdir.
  void smsShare() {}
}

class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('a');
    return true;
  }

  @override
  launchUrl(String path) {
    // TODO: implement launchUrl
    throw UnimplementedError();
  }

  @override
  Future<void> toShare(String path) async {
    await launchUrl("sms:$path");
  }
}

class FileItem {
  final String name;
  final String file;

  FileItem(this.name, this.file);
}

class AbcDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    throw UnimplementedError();
  }
}

// mixin'lerin artisi mixinin yanina on koyup sadece belli durumlardan turetebiliyoruz.
//yani sadece IFileDownload'dan tureyenlere bu ozelligi kazandirabiliyorum.
mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}
