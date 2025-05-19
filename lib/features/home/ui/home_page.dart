import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/home/bloc/home_bloc.dart';
import 'package:portfolio/features/home/ui/widget/ProjectCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '안녕하세요!\nFlutter 개발자 오윤준입니다.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('📂 주요 프로젝트', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is projectLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProjectLoaded) {
                    return Column(
                      children: state.projects.map((p) => ProjectCard(project: p)).toList(),
                    );
                  } else {
                    return const Text('프로젝트를 불러오는 중 문제가 발생했습니다.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
