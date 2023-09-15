import 'dart:developer';

import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/202/image_learn202.dart';
import 'package:flutter_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_learn/303/reqres_resource/view_model/reqres_provider.dart';
import 'package:flutter_learn/303/reqres_resource/view_model/reqres_view_model.dart';
import 'package:flutter_learn/product/extensions/string_extension.dart';
import 'package:flutter_learn/product/global/resource_context.dart';
import 'package:flutter_learn/product/global/theme_notifier.dart';
import 'package:flutter_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';

// 3...
// sayfam acildiginda bir istek atacak ve bu istegi title'da gosterebilirlm..
class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

// class _ReqResViewState extends ReqResViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  // 8. provider'i ekle. Ama instance vermeden kullanacagiz.
  // instance vermeden kullanmak icin scaffoldi changeNotiferProvider ile sarmalayaip
  // ekran calisacaksa scaffoldun builderda calismasi lazim..
  // create'le provider'imi olusturuyorum.
  // Builder'da context icinde oldugum icin (ChangeNotifierProvider contexi)
  // burada datalari okuyup islemlendirebiliyorum.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Bu ekrana haber verecegim demek..
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
          }),
          appBar: AppBar(
            // onpressede bastiginda datayi save etsin.
            actions: const [
              _SaveandNavigate(),
            ],

            // isLoading'i provider instance'i vermedene okumain yolu context icindeki read ya da watch metodudur.
            // read sadece bir kez okur, dinlemez. watch degisiklikleri dinler, takip eder.
            title: context.watch<ReqResProvider>().isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : null,
          ),
          body: Column(
            children: [
              //const Placeholder(),
              // bu durumda bu provider'i sadece isloading duurmunda calismasini saglayabilirlm.
              // 10. Ben bu durumda bu component'i sadece viewmodel uzerinde dinleyip geri donduren bir yapiya cevirmis oldum..
              // yani bir duurma gore bir durumu handle et.
              // Yani context.watch yerin selector de kullanabilirz.
              const _TempPlaceHolder(),
              Expanded(child: _resourceListView(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        // 4.inspect ettigim zaman modelin ne geldigini gorebiliyorum..
        // inspect(items[index]);
        // 6. bu colorValue gibi metotlari burada yapmamaliyiz. Bu model'in isi..

        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: Text(items[index].name ?? ''),
        );
      },
    );
  }
}

class _SaveandNavigate extends StatelessWidget {
  const _SaveandNavigate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<ReqResProvider>().saveToLocal(context.read<ResourceContext>());
          // sonra imageLearn sayfasinda bu datayi oku.
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const ImageLearn202();
          }));
        },
        child: const Icon(Icons.ac_unit));
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<ReqResProvider, bool>(builder: (context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }, selector: (context, provider) {
      return provider.isLoading;
    });
  }
}
