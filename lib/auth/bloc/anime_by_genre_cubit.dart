import 'package:potatoes/auto_content/bloc/auto_content_cubit.dart';
import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/auth/services/auth_service.dart';

class AnimeByGenreCubit extends AutoListCubit<Anime> {
  final AuthService authService;
  final AnimeCubitManager cubitManager;
  final String selectedTarget;
  AnimeByGenreCubit({
    required this.cubitManager,
    required this.authService,
    required this.selectedTarget,
  }) : super(
            provider: ({page = 1}) => authService.getAnimes(
                  page: page,
                  selectedTarget: selectedTarget,
                ));

  @override
  void onChange(Change<AutoListState<Anime>> change) {
    // if (state is AnimeReadyWithSelectionState &&
    //     change.nextState is AutoListReadyState<Anime>) {
    //   var stateBefore = state as AnimeReadyWithSelectionState;
    //   final nextState = change.nextState as AutoListReadyState<Anime>;
    //   final updatedItems = PaginatedList(
    //     items: [...stateBefore.items.items, ...nextState.items.items],
    //     total: nextState.items.total,
    //     page: nextState.items.page,
    //   );
    //   emit(AnimeReadyWithSelectionState(updatedItems, stateBefore.myList));
    // }
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Anime>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Anime>).items.items);
    }
  }
}

//   void addTolist(Anime anime) {
//     if (state is AnimeReadyWithSelectionState) {
//       var stateBefore = state as AnimeReadyWithSelectionState;
//       List<Anime> updatedmyList;

//       if (stateBefore.myList.contains(anime)) {
//         updatedmyList = stateBefore.myList.where((c) => c != anime).toList();
//       } else {
//         updatedmyList = [...stateBefore.myList, anime];
//       }

//       emit(AnimeReadyWithSelectionState(stateBefore.items, updatedmyList));
//     } else {
//       var stateBefore = state as AutoListReadyState<Anime>;
//       emit(AnimeReadyWithSelectionState(stateBefore.items, [anime]));
//     }
//   }

//   void removeFromlist(Anime anime) {
//     if (state is AnimeReadyWithSelectionState) {
//       var stateBefore = state as AnimeReadyWithSelectionState;
//       List<Anime> updatedmyList =
//           stateBefore.myList.where((c) => c != anime).toList();

//       emit(AnimeReadyWithSelectionState(
//         stateBefore.items,
//         updatedmyList,
//       ));
//     }
//   }

//   bool isAnimeInlist(Anime anime) {
//     if (state is AnimeReadyWithSelectionState) {
//       return (state as AnimeReadyWithSelectionState).myList.contains(anime);
//     }
//     return false;
//   }
// }

// typedef AnimeReadyState = AutoListReadyState<Anime>;

// class AnimeReadyWithSelectionState extends AutoListReadyState<Anime> {
//   final List<Anime> myList;
//   const AnimeReadyWithSelectionState(
//     super.items, [
//     this.myList = const [],
//   ]);
//   @override
//   List<Object?> get props => [...super.props, myList];
// }

abstract class AvailableValues {
  static const watchlist = "WATCHLIST";
  static const viewed = "VIEWED";
}
