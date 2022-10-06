import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';
import 'package:tdd_post/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:tdd_post/presentation/blocs/post/post_bloc.dart';
import 'package:tdd_post/presentation/pages/detail_page.dart';
import 'package:tdd_post/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (_) => locator<PostBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts Bloc"),
        ),
        body: Stack(
          children: const [
            PostListView(),
            LoadingView(),
          ],
        ),
        floatingActionButton: BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            if(state is OpenSuccessState) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
            }
          },
          child: FloatingActionButton(
            onPressed: () {
              context.read<NavigationBloc>().add(const OpenEvent(page: "detail", data: {"page": "detail"}));
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if(state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const SizedBox.shrink();
      }
    );
  }
}


class PostListView extends StatelessWidget {
  const PostListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(GetAllPostEvent());
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {


        if(state is Loading) {
          print("object: Loading");
        }

        if(state is DeletePostSuccessState) {
          context.read<PostBloc>().add(GetAllPostEvent());
        }
        if(state is Error) {
          print(state.message);
        }
      },
      buildWhen: (previous, current) {
        return current is GetAllPostSuccessState;
      },
      builder: (context, state) {
        if (state is GetAllPostSuccessState) {
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              return ItemPostView(post: state.list[index],);
            },
          );
        }

        return const Center(
          child: Text("NO DATA"),
        );
      },
    );
  }
}

class ItemPostView extends StatelessWidget {
  final Post post;
  const ItemPostView ({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.update,
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<PostBloc>().add(DeletePostEvent(id: post.id));
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline,
          ),
        ],
      ),
      child: Card(
        elevation: 5,
        child: ListTile(
          title: Text(
            post.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            post.body,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

