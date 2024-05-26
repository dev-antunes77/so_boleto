import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:so_boleto/domain/database/hive_bills.dart';
import 'package:so_boleto/domain/usecases/create_bill_usecase.dart';
import 'package:so_boleto/domain/usecases/delete_bill_usecase.dart';
import 'package:so_boleto/domain/usecases/get_bills_usecase.dart';
import 'package:so_boleto/infra/local_database/hive_database/hive_bill_model.dart';
import 'package:so_boleto/infra/local_database/hive_database/hive_bills_database.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

abstract class InjectionService {
  static final _i = GetIt.instance;

  static T get<T extends Object>() => _i.get<T>();

  static Future<void> init() async {
    await _initStorages();
    // await _initServices();
    _initUseCases();
    _initBloc();
  }

  static Future<HiveBills> _initStorages() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveBillModelAdapter());
    _i.registerFactory<HiveBillsDatabase>(() => HiveBillsDatabase());
    return _i.get<HiveBillsDatabase>();
  }

  // static Future<void> _initFirebase() async {
  //   await Firebase.initializeApp(
  //     options: Environment.instance.firebaseOptions.instance,
  //   );

  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // }

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

  // static Future<void> _initServices() async {
  //   _i.registerSingleton<AnalyticsService>(
  //       FirebaseAnalyticsService(_i.get<LocalStorage>()));

  //   final playerService = await AudioServiceInitializer.init(
  //     _i.get<SongRepository>(),
  //   );
  //   _i.registerSingleton<PlayerService>(playerService);

  //   final apiAuthRepository = ApiAuthService(_i.get<AuthRepository>());
  //   _i.registerSingleton<AuthService>(apiAuthRepository);
  // }

  static void _initUseCases() {
    // Bill Usecase
    _i.registerFactory(
      () => GetBillsUseCase(_i.get<HiveBillsDatabase>()),
    );
    _i.registerFactory(
      () => CreateBillUseCase(_i.get<HiveBillsDatabase>()),
    );
    _i.registerFactory(
      () => DeleteBillUseCase(_i.get<HiveBillsDatabase>()),
    );
    // _i.registerFactory(
    //   () => SignUpUseCase(
    //     _i.get<AuthService>(),
    //     _i.get<LocalStorage>(),
    //   ),
    // );
    // _i.registerFactory(
    //   () => SignOutUseCase(
    //     _i.get<AuthService>(),
    //     _i.get<LocalStorage>(),
    //   ),
    // );

    //Player Use Case
    // _i.registerFactory(
    //   () => ChangePlayerRadioUseCase(
    //     _i.get<PlayerService>(),
    //     _i.get<LocalStorage>(),
    //   ),
    // );
    // _i.registerFactory(() => TogglePlayerUseCase(_i.get<PlayerService>()));
    // _i.registerFactory(() => ListenPlayerSongUseCase(_i.get<PlayerService>()));
    // _i.registerFactory(
    //   () => ListenPlayerSongStateUseCase(_i.get<PlayerService>()),
    // );
    // _i.registerFactory(() => GetUserUseCase(_i.get<LocalStorage>()));
    // _i.registerFactory(
    //   () => RadioChangeTimerEventUseCase(_i.get<AnalyticsService>()),
    // );

    // //Live UseCase
    // _i.registerFactory(() => GetSliderRadiosUseCase(_i.get<RadioRepository>()));
    // _i.registerFactory(() => CheckOnboardingUseCase(_i.get<LocalStorage>()));
    // _i.registerFactory(() => FinishOnboardingUseCase(_i.get<LocalStorage>()));

    // //Radios Use Case
    // _i.registerFactory(() => GetRadiosUseCase(_i.get<RadioRepository>()));
    // _i.registerFactory(
    //   () => GetFavoriteRadiosUseCase(
    //     _i.get<RadioRepository>(),
    //     _i.get<LocalStorage>(),
    //     _i.get<Cache>(),
    //   ),
    // );
    // _i.registerFactory(
    //   () => ToggleFavoriteRadioUseCase(
    //     _i.get<RadioRepository>(),
    //     _i.get<LocalStorage>(),
    //     _i.get<Cache>(),
    //     _i.get<AnalyticsService>(),
    //   ),
    // );
    // _i.registerFactory(() => GetLastRadioUseCase(_i.get<LocalStorage>()));
    // _i.registerFactory(() => IsFavoriteRadioUseCase(_i.get<Cache>()));

    //Profile Use Case
    // _i.registerFactory(
    //   () => GetLegalTextsUseCase(_i.get<EditorialRepository>()),
    // );

    // //Initial Use Case
    // _i.registerFactory(
    //   () => BottomButtonEventUseCase(_i.get<AnalyticsService>()),
    // );
    // _i.registerFactory(
    //   () => CheckVersionUpdateUseCase(_i.get<UpdateRepository>()),
    // );
  }

  static void _initBloc() {
    _i.registerFactory(
      () => InitialCubit(),
    );

    _i.registerFactory(
      () => HomeBillsCubit(
        _i.get<GetBillsUseCase>(),
      ),
    );

    _i.registerFactory(
      () => BillCubit(),
    );

    // _i.registerFactory(
    //   () => PlayerCubit(
    //     _i.get<ChangePlayerRadioUseCase>(),
    //     _i.get<ToggleFavoriteRadioUseCase>(),
    //     _i.get<TogglePlayerUseCase>(),
    //     _i.get<GetLastRadioUseCase>(),
    //     _i.get<ListenPlayerSongUseCase>(),
    //     _i.get<ListenPlayerSongStateUseCase>(),
    //     _i.get<RadioChangeTimerEventUseCase>(),
    //   ),
    // );

    // _i.registerFactory(
    //   () => LiveCubit(
    //     _i.get<FinishOnboardingUseCase>(),
    //     _i.get<CheckOnboardingUseCase>(),
    //     _i.get<GetSliderRadiosUseCase>(),
    //     _i.get<GetLastRadioUseCase>(),
    //     _i.get<IsFavoriteRadioUseCase>(),
    //   ),
    // );

    // _i.registerFactory(
    //   () => ProfileCubit(
    //     _i.get<GetLegalTextsUseCase>(),
    //     _i.get<GetUserUseCase>(),
    //   ),
    // );

    // _i.registerFactory(
    //   () => RadiosCubit(
    //     _i.get<GetRadiosUseCase>(),
    //     _i.get<GetFavoriteRadiosUseCase>(),
    //   ),
// );
  }
}
