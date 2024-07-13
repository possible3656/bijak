import '../../../data/home_page_data_model.dart';

/// Repository class for fetching home page data.
class HomeRepo {
  /// Fetches home page data asynchronously.
  ///
  /// Returns a [Future] that completes with a [HomePageDataModel] after a delay of 5 seconds.
  /// The [HomePageDataModel] contains slider images, categories, recent orders, and seasonal products.
  Future<HomePageDataModel> getHomePageData() {
    return Future.delayed(const Duration(seconds: 5), () {
      return HomePageDataModel(
        sliderImages: <String>[
          'https://img.freepik.com/premium-vector/grocery-store-promotion-catalog-cheap-price-flyer-template_606364-656.jpg?w=740',
          'https://img.freepik.com/premium-vector/supermarket-online-shop-promotion-flyer-catalog-template_606364-664.jpg?w=740',
          'https://img.freepik.com/premium-vector/promotion-flyer-template-design-grocery-store_606364-761.jpg?w=740',
        ],
        categories: <Category>[
          Category(
            title: 'Fruits',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
          ),
          Category(
            title: 'Vegetables',
            image:
                'https://t4.ftcdn.net/jpg/03/20/39/89/360_F_320398931_CO8r6ymeSFqeoY1cE6P8dbSGRYiAYj4a.jpg',
          ),
          Category(
            title: 'Juices',
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShxK2QV1fG8KWdfgjOJ71_neEbObsvB6lFPQ&s',
          ),
          Category(
            title: 'Combos',
            image:
                'https://www.spoton.com/blog/content/images/size/w1200/2023/08/Mocktail--zero-proof-cocktails--and-different-non-alcoholic-drinks-1.jpeg',
          ),
          Category(
            title: 'Pure Produced Items',
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnFdTreGIiC27qhxWk6fxVVGnvRb2_4zC9sA&s',
          ),
        ],
        recentOrder: <Product>[
          Product(
            id: 0,
            name: 'Apple',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '100',
            description:
                'Fresh and juicy apples, perfect for a healthy snack or baking your favorite pies. Apples are rich in fiber and antioxidants, making them a great addition to any diet.',
          ),
          Product(
            id: 1,
            name: 'Banana',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '50',
            description:
                'Sweet and ripe bananas, ideal for breakfast smoothies or a quick energy boost. Bananas are packed with potassium and other essential nutrients, making them a staple in any healthy lifestyle.',
          ),
          Product(
            id: 2,
            name: 'Orange',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '60',
            description:
                'Citrus oranges, rich in vitamin C and perfect for juicing or snacking. Oranges provide a refreshing and tangy flavor that is both delicious and nutritious.',
          ),
          Product(
            id: 3,
            name: 'Mango',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '80',
            description:
                'Tropical mangoes, bursting with flavor and ideal for desserts or eating fresh. Mangoes are a good source of vitamins A and C, adding a tropical twist to your meals.',
          ),
          Product(
            id: 4,
            name: 'Pineapple',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '70',
            description:
                'Fresh pineapples, juicy and tangy, great for tropical salads or grilling. Pineapples are known for their anti-inflammatory properties and unique sweet-tart flavor.',
          ),
        ],
        seasonalProducts: <Product>[
          Product(
            id: 10,
            name: 'Apple',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '100',
            description:
                'Fresh and juicy apples, perfect for a healthy snack or baking your favorite pies. Apples are rich in fiber and antioxidants, making them a great addition to any diet.',
          ),
          Product(
            id: 11,
            name: 'Banana',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '50',
            description:
                'Sweet and ripe bananas, ideal for breakfast smoothies or a quick energy boost. Bananas are packed with potassium and other essential nutrients, making them a staple in any healthy lifestyle.',
          ),
          Product(
            id: 12,
            name: 'Orange',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '60',
            description:
                'Citrus oranges, rich in vitamin C and perfect for juicing or snacking. Oranges provide a refreshing and tangy flavor that is both delicious and nutritious.',
          ),
          Product(
            id: 13,
            name: 'Mango',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '80',
            description:
                'Tropical mangoes, bursting with flavor and ideal for desserts or eating fresh. Mangoes are a good source of vitamins A and C, adding a tropical twist to your meals.',
          ),
          Product(
            id: 14,
            name: 'Pineapple',
            image:
                'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
            price: '70',
            description:
                'Fresh pineapples, juicy and tangy, great for tropical salads or grilling. Pineapples are known for their anti-inflammatory properties and unique sweet-tart flavor.',
          ),
        ],
      );
    });
  }
}
