import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_learn/202/cache/shared_manager.dart';
import 'package:flutter_learn/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager userCacheManager;
  final List<User> _users = UserItems().users;

  @override
  void initState() {
    super.initState();
    userCacheManager = UserCacheManager(SharedManager());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor) : null,
        actions: [
          IconButton(
              onPressed: () async {
                changeLoading();
                await userCacheManager.saveItems(_users);
                changeLoading();
              },
              icon: const Icon(Icons.download_for_offline_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle_outline)),
        ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
                title: Text(users[index].name),
                subtitle: Text(users[index].description),
                trailing: Text(
                  users[index].url,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(decoration: TextDecoration.underline),
                )),
          );
        });
  }
}
