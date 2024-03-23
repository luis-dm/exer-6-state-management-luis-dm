# Exercise 6: State Management

## Student Information

- Name: Luis Adrian F. De Mesa
- Student Number: 2022-00599
- Section: UV1l

## Application Description

Create a mobile mobile shopping app with a catalog, cart, and checkout screens. The user is able to add items to their shopping cart by clicking the add button of a corresponding item. Afterwards, they may visit their shopping cart and consequently the checkout screen to simulate the payment for the items.

## Things done in the code

Folders were made to separate the model, provider, and screens. In Item.dart in the model folder, the model of the Item is defined, where an item has a name, price, and quantity.

Meanwhile, in shoppingcart_provider.dart, methods were defined to manage a shopping cart (eg. adding items, removing all items, and removing a specific item by its name). The class also maintains the list of items in the cart, as well as the total cost of items in the cart. It also provides getters and methods to manipulate the contents of the cart. Lastly, it uses ChangeNotifier to notify listeners when the contents/items of the cart changes.

On the other hand, in MyCatalog.dart under the screen folder, the list of items is initialized, where their name, price, and quantity is defined according to the item model. When the Add button is clicked, we use the addItem method from the shopping cart provider to add the item to the \_shoppingList. Also, when the shopping cart button floating action button is clicked, we navigate to the cart screen which is encompassed by MyCart.dart where the items are displayed through the getItems widget wherein the display dynamically changes whether there are items on the cart or not (if there are no items, a message is displayed, while the items in the cart are displayed along with a delete button which uses the removeItem method in the shopping cart provider to remove the item from the curreent cart). The computeCost widget gets the cartTotal from the shopping cart and displays the total price of the items in the cart as a text. The reset button also exists in the cart screen which uses the removeAll function of the shopping cart provider to remove all of the items in the cart. Lastly, there are also buttons to navigate to the product catalog and the checkout screens. In Checkout.dart, the getItem widget and computeCost widgets are also used for the same functions. The Pay now elevated button can be found in this screen where a simulation of a payment is done -- where we display a message confirming the payment and then removing all of the items in the cart through the shopping cart provider's remove all method and then going back to the catalog screen.

Lastly, in main.dart, we wrap the root widget MyApp using Multiprovider where the ChangeNotifierProvider creates an instance of ShoppingCart, making it accessible to all descendants of the MyApp widget tree using context.read. The routes for the various screens are also defined.

## Challenges when developing the application

It was my first time using providers in flutter through this exercise, so I was a bit uncomfortable at the start at accessing the shopping cart provider through context.read. Moreover, I also struggled in getting used to the syntax for using the SnackBar Scaffold Messenger.
