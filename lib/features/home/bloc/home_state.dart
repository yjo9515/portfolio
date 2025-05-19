part of 'home_bloc.dart';

@CopyWith()
class HomeState extends CommonState {
  const HomeState({
    super.status,
    super.errorMessage,
    super.hasReachedMax,
    super.page,
    super.query,
    this.isLoading = true,
    this.projects = const []
  });

  final bool isLoading;
  final List<Project> projects;

  @override
  List<Object?> get props => [...super.props, isLoading, projects];
}
