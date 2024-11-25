import 'package:potatoes/auto_list.dart'; 
import 'package:umai/actu/services/actu_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/actu/models/actu.dart'; 
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/services/social_service.dart';

class ActuFeedCubit extends AutoListCubit<Actu> {
  final ActuService actutService;
  final PersonCubitManager personCubitManager;
  final PostCubitManager cubitManager;

  ActuFeedCubit(
    this.actutService,
    this.cubitManager,
    this.personCubitManager,
  ) : super(provider: actutService.getFeed);
}
