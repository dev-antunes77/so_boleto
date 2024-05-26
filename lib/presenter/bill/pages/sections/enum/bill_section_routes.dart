// import 'package:so_boleto/core/routes/routes.dart';

// enum BillSectionRoutes {
//   name(0),
//   description(1),
//   parcels(2),
//   billValue(3),
//   dueDay(4),
//   category(5);

//   const BillSectionRoutes(this.value);

//   final int value;

//   static BillSectionRoutes fromIndex(int value) {
//     for (BillSectionRoutes section in BillSectionRoutes.values) {
//       if (section.value == value) {
//         return section;
//       }
//     }
//     return name;
//   }

//   static String getRoute(BillSectionRoutes page) {
//     String route;
//     switch (page) {
//       case BillSectionRoutes.name:
//         route = Routes.home;
//       case BillSectionRoutes.description:
//         route = Routes.expenses;
//       case BillSectionRoutes.parcels:
//         route = Routes.profile;

//       default:
//         route = Routes.home;
//     }

//     route += Routes.app;

//     return route;
//   }
// }
