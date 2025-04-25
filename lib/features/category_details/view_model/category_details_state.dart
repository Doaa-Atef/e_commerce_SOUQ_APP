part of 'category_details_cubit.dart';

@immutable
sealed class CategoryDetailsState {}

final class CategoryDetailsInitial extends CategoryDetailsState {}
final class CategoryDetailsLoading extends CategoryDetailsState {}
class CategoryDetailsSuccess extends CategoryDetailsState {}

final class CategoryDetailsError extends CategoryDetailsState {}
