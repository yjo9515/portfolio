import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:portfolio/features/home/bloc/home_bloc.dart';
import 'package:portfolio/features/home/ui/widget/ProjectCard.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/util/static_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.85);

    return BlocProvider(
      create: (_) => HomeBloc()..add(const Initial()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '안녕하세요\nFlutter 개발자 윤준오의 포트폴리오 웹사이트입니다.',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 12,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            _launchURL(context,'https://github.com/yjo9515');
                          },
                          icon: const Icon(Icons.code),
                          label: const Text('GitHub'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            _launchURL(context,'https://velog.io/@juno_app/2025-Flutter-IT%EC%82%B0%EC%97%85%EA%B8%B0%EB%8A%A5%EC%9A%94%EC%9B%90-%ED%9A%8C%EA%B3%A0%EB%A1%9D');
                          },
                          icon: const Icon(Icons.article),
                          label: const Text('Velog 회고록'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('📂 주요 프로젝트', style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 10),
                    const Text('* 이미지를 클릭하시면 확대된 이미지를 보실 수 있습니다',style: TextStyle(fontSize: 15, color: Colors.red)),
                    const SizedBox(height: 16),
                    if (state.isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (state.projects != null && state.projects.isNotEmpty)
                      Column(
                        children: [
                          SizedBox(
                            height: 700, // 카드 높이
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: state.projects.length,
                              itemBuilder: (context, index) {
                                final project = state.projects[index];
                                return AnimatedBuilder(
                                  animation: pageController,
                                  builder: (context, child) {
                                    double value = 1.0;
                                    if (pageController.position.haveDimensions) {
                                      value = pageController.page! - index;
                                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                                    }
                                    return Transform.scale(
                                      scale: value,
                                      child: child,
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: ProjectCard(project: project),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          SmoothPageIndicator(
                            controller: pageController,
                            count: state.projects.length,
                            effect: ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      )
                    else
                      const Text('표시할 프로젝트가 없습니다.'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Future<void> _launchURL(BuildContext context, String url) async {
  final uri = Uri.parse(url);
  try {
    final success = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!success) {
      errorDialog(context, '링크를 열 수 없습니다: $url', () {});
    }
  } catch (e) {
    errorDialog(context, '오류 발생: $e', () {});
  }
}
