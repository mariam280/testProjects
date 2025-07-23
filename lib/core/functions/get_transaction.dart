
  import '../../feature/chek_out/data/models/amount_model/amount_model.dart';
import '../../feature/chek_out/data/models/amount_model/details.dart';
import '../../feature/chek_out/data/models/item_list_model/item_list_model.dart';
import '../../feature/chek_out/data/models/item_list_model/order_item.dart';

({AmountModel amountModel, ItemListModel itemListModel}) getTransaction() {      // record بعمله لو عايزة ارجع كذا datatype في نفس الميثود
    AmountModel amountModel = AmountModel(
      currency: 'USD',
      total: '70',
      details: Details(
        subtotal: '70',
        shipping: '0',
        shippingDiscount: 0,   // رقم مش نسبة مئوية
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(name: "Apple", quantity: 4, price: '5', currency: "USD"),
      OrderItemModel(
          name: "Pineapple", quantity: 5, price: '10', currency: "USD"),
    ];
    ItemListModel itemListModel = ItemListModel(orders: orders);
    return (amountModel: amountModel, itemListModel: itemListModel);
  }