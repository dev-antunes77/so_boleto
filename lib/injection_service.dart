import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:so_boleto/core/environment/firebase_env.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/domain/usecases/add_prompt_bills.dart';
import 'package:so_boleto/domain/usecases/clear_user_storage.dart';
import 'package:so_boleto/domain/usecases/create_bill.dart';
import 'package:so_boleto/domain/usecases/create_user.dart';
import 'package:so_boleto/domain/usecases/create_user_storage.dart';
import 'package:so_boleto/domain/usecases/delete_bill.dart';
import 'package:so_boleto/domain/usecases/edit_bill.dart';
import 'package:so_boleto/domain/usecases/filter_bills_by_params.dart';
import 'package:so_boleto/domain/usecases/get_bills.dart';
import 'package:so_boleto/domain/usecases/get_user_from_firebase.dart';
import 'package:so_boleto/domain/usecases/get_user_from_storage.dart';
import 'package:so_boleto/domain/usecases/set_bill_as_paid.dart';
import 'package:so_boleto/domain/usecases/sign_in.dart';
import 'package:so_boleto/domain/usecases/sign_out.dart';
import 'package:so_boleto/domain/usecases/sign_up.dart';
import 'package:so_boleto/domain/usecases/update_user_storage.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bill_model.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bills_database.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_data.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_database.dart';
import 'package:so_boleto/infra/services/auth_service/auth_service.dart';
import 'package:so_boleto/infra/services/firestore_service/firestore_service.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/expenses/cubit/expenses_cubit.dart';
import 'package:so_boleto/presenter/filter/cubit/filter_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
import 'package:so_boleto/presenter/profile/cubit/profile_cubit.dart';
import 'package:so_boleto/presenter/prompt_bills/cubit/prompt_bills_cubit.dart';

abstract class InjectionService {
  static final _i = GetIt.instance;

  static T get<T extends Object>() => _i.get<T>();

  static Future<void> init() async {
    await _initFirebase();
    await _initLocalStorage();
    await _initServices();
    _initUseCases();
    _initBloc();
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(options: FirebaseEnv.instance);
  }

  static Future<void> _initLocalStorage() async {
    await Hive.initFlutter();

    Hive.registerAdapter(HiveUserDataAdapter());
    _i.registerFactory<HiveUserDatabase>(() => HiveUserDatabase());
    _i.get<HiveUserDatabase>();

    Hive.registerAdapter(HiveBillModelAdapter());
    _i.registerFactory<HiveBillsDatabase>(() => HiveBillsDatabase());
    _i.get<HiveBillsDatabase>();
  }

  // static Future<void> _initStorages() async {
  //   _i.registerSingleton<LocalStorage>(
  //     SharedPreferencesLocalStorage(await SharedPreferences.getInstance()),
  //   );

  //   _i.registerSingleton<Cache>(LocalCache());
  // }

  // static void _initNetwork() {
  //   _i.registerSingleton<RadiosClient>(HttpRadiosClient());
  //   _i.registerSingleton<ApiService>(HttpApiService(_i.get<RadiosClient>()));
  // }

  //   final apiService = _i.get<ApiService>();

  //   _i.registerFactory<AuthRepository>(() => ApiAuthRepository(apiService));
  //   _i.registerFactory<RadioRepository>(() => ApiRadioRepository(apiService));
  //   _i.registerFactory<SongRepository>(() => ApiSongRepository(apiService));
  //   _i.registerFactory<UpdateRepository>(() => ApiUpdateRepository(apiService));
  //   _i.registerFactory<EditorialRepository>(
  //     () => ApiEditorialRepository(apiService),
  //   );
  // }

  static Future<void> _initServices() async {
    _i.registerSingleton<FirestoreService>(FirestoreService());
    _i.registerSingleton<AuthService>(AuthService());

    // final playerService = await AudioServiceInitializer.init(
    //   _i.get<SongRepository>(),
    // );
    // _i.registerSingleton<PlayerService>(playerService);

    // final apiAuthRepository = ApiAuthService(_i.get<AuthRepository>());
    // _i.registerSingleton<AuthService>(apiAuthRepository);
  }

  static void _initUseCases() {
    _i.registerFactory(
      () => CreateUser(
        _i.get<FirestoreService>(),
      ),
    );

    _i.registerFactory(
      () => CreateUserStorage(
        _i.get<HiveUserDatabase>(),
      ),
    );

    _i.registerFactory(
      () => UpdateUserStorage(
        _i.get<HiveUserDatabase>(),
      ),
    );

    _i.registerFactory(
      () => GetUserFromStorage(
        _i.get<HiveUserDatabase>(),
      ),
    );

    _i.registerFactory(
      () => ClearUserStorage(
        _i.get<HiveUserDatabase>(),
      ),
    );

    _i.registerFactory(
      () => GetUserFromFirebase(
        _i.get<FirestoreService>(),
      ),
    );

    _i.registerFactory(
      () => SignUp(
        _i.get<AuthService>(),
      ),
    );

    _i.registerFactory(
      () => SignIn(
        _i.get<AuthService>(),
      ),
    );

    _i.registerFactory(
      () => SignOut(
        _i.get<AuthService>(),
      ),
    );

    // Bill Usecase
    _i.registerFactory(
      () => GetBills(
        _i.get<HiveBillsDatabase>(),
        _i.get<FirestoreService>(),
      ),
    );

    _i.registerFactory(
      () => CreateBill(
        _i.get<HiveBillsDatabase>(),
        _i.get<FirestoreService>(),
      ),
    );

    _i.registerFactory(
      () => SetBillAsPaid(
        _i.get<HiveBillsDatabase>(),
        _i.get<FirestoreService>(),
      ),
    );

    _i.registerFactory(
      () => DeleteBill(
        _i.get<HiveBillsDatabase>(),
        _i.get<FirestoreService>(),
      ),
    );

    _i.registerFactory(
      () => EditBill(
        _i.get<HiveBillsDatabase>(),
        _i.get<FirestoreService>(),
      ),
    );

    _i.registerFactory(
      () => FilterBillsByParams(),
    );

    _i.registerFactory(
      () => AddPromptBills(
        _i.get<HiveBillsDatabase>(),
        _i.get<FirestoreService>(),
      ),
    );
  }

  static void _initBloc() {
    _i.registerFactory(
      () => ThemeCubit(),
    );

    _i.registerFactory(
      () => InitialCubit(
        _i.get<SignUp>(),
        _i.get<SignIn>(),
        _i.get<GetUserFromStorage>(),
        _i.get<GetUserFromFirebase>(),
        _i.get<CreateUser>(),
        _i.get<CreateUserStorage>(),
        _i.get<UpdateUserStorage>(),
      ),
    );

    _i.registerFactory(
      () => HomeBillsCubit(
        _i.get<GetBills>(),
        _i.get<CreateBill>(),
        _i.get<SetBillAsPaid>(),
        _i.get<DeleteBill>(),
        _i.get<EditBill>(),
        _i.get<FilterBillsByParams>(),
        _i.get<AddPromptBills>(),
      ),
    );

    _i.registerFactory(
      () => BillCubit(),
    );

    _i.registerFactory(
      () => FilterCubit(),
    );

    _i.registerFactory(
      () => PromptBillsCubit(),
    );

    _i.registerFactory(
      () => ExpensesCubit(),
    );

    _i.registerFactory(
      () => ProfileCubit(
        _i.get<SignOut>(),
        _i.get<ClearUserStorage>(),
      ),
    );
  }
}
