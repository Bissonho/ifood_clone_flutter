import '../core/theme/app_imagens.dart';
import '../models/category.dart';

class ContentController {
  List<Category> getCategorys() {
    return [
      Category(name: 'Doces & Bolos', picture: AppImages.doces_e_bolo),
      Category(name: 'Promoções', picture: AppImages.promocoes),
      Category(name: 'Açãi', picture: AppImages.acai),
      Category(name: 'Salgados', picture: AppImages.salgados),
      Category(name: 'Baasileira', picture: AppImages.brasileira),
      Category(name: 'Pastel', picture: AppImages.pastel),
      Category(name: 'Padarias', picture: AppImages.padarias),
      Category(name: 'Pizza', picture: AppImages.pizza),
      Category(name: 'Saudável', picture: AppImages.saudavel),
      Category(name: 'Sorvetes', picture: AppImages.sorvetes),
      Category(name: 'Lanches', picture: AppImages.lanches),
      Category(name: 'Marmita', picture: AppImages.marmita),
      Category(name: 'Japonesa', picture: AppImages.japonesa),
      Category(name: 'Vegetariana', picture: AppImages.vegetariana),
    ];
  }
}
