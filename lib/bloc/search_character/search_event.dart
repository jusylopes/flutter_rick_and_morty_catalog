part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Search extends SearchEvent {
  Search(this.name);

  final String name;
}
