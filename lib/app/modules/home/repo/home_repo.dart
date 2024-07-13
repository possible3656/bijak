import 'package:bijak/app/data/home_page_data_model.dart';

/// Repository class for fetching home page data.
class HomeRepo {
  /// Fetches home page data asynchronously.
  ///
  /// Returns a [Future] that completes with a [HomePageDataModel] after a delay of 5 seconds.
  /// The [HomePageDataModel] contains slider images, categories, recent orders, and seasonal products.
  Future<HomePageDataModel> getHomePageData() {
    return Future.delayed(const Duration(seconds: 5), () {
      return HomePageDataModel(sliderImages: [
        'https://img.freepik.com/premium-vector/grocery-store-promotion-catalog-cheap-price-flyer-template_606364-656.jpg?w=740',
        'https://img.freepik.com/premium-vector/supermarket-online-shop-promotion-flyer-catalog-template_606364-664.jpg?w=740',
        'https://img.freepik.com/premium-vector/promotion-flyer-template-design-grocery-store_606364-761.jpg?w=740',
      ], categories: [
        Category(
            title: 'Fruits',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg'),
        Category(
            title: 'Vegetables',
            image:
                'https://t4.ftcdn.net/jpg/03/20/39/89/360_F_320398931_CO8r6ymeSFqeoY1cE6P8dbSGRYiAYj4a.jpg'),
        Category(
            title: 'Juices',
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShxK2QV1fG8KWdfgjOJ71_neEbObsvB6lFPQ&s'),
        Category(
            title: 'Combos',
            image:
                'https://www.spoton.com/blog/content/images/size/w1200/2023/08/Mocktail--zero-proof-cocktails--and-different-non-alcoholic-drinks-1.jpeg'),
        Category(
            title: 'Pure Produced Items',
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnFdTreGIiC27qhxWk6fxVVGnvRb2_4zC9sA&s'),
      ], recentOrder: [
        Product(
            name: 'Apple',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '100',
            weight: '1kg'),
        Product(
            name: 'Banana',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '50',
            weight: '1kg'),
        Product(
            name: 'Orange',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '60',
            weight: '1kg'),
        Product(
            name: 'Mango',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '80',
            weight: '1kg'),
        Product(
            name: 'Pineapple',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '70',
            weight: '1kg'),
      ], seasonalProducts: [
        Product(
            name: 'Apple',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '100',
            weight: '1kg'),
        Product(
            name: 'Banana',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '50',
            weight: '1kg'),
        Product(
            name: 'Orange',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '60',
            weight: '1kg'),
        Product(
            name: 'Mango',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '80',
            weight: '1kg'),
        Product(
            name: 'Pineapple',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '70',
            weight: '1kg'),
      ]);
    });
  }
}
