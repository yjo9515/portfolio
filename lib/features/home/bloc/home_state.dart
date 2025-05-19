part of 'home_bloc.dart';

@CopyWith()
class HomeState extends CommonState {
  const HomeState({
    super.status,
    super.errorMessage,
    super.hasReachedMax,
    super.page,
    super.query,
    this.isLoading = true
  });

  final bool isLoading;

  @override
  List<Object?> get props => [...super.props, isLoading];
}
