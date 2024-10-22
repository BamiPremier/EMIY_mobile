import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/user_service.dart';

class PersonCubitManager extends CubitManager<PersonCubit, User, String> {
  final UserService userService;

  PersonCubitManager(this.userService);

  @override
  String buildId(User object) {
    return object.id;
  }

  @override
  PersonCubit create(User object) {
    return PersonCubit(userService, object);
  }

  @override
  void updateCubit(PersonCubit cubit, User object) {
    cubit.update(object);
  }
}
