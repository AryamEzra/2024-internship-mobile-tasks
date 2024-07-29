import 'dart:io';

class Product{
  String? name, description;
  double? price;

  Product(this.name,this.description,this.price,);
  
  @override
  String toString() {
    return 'Name: $name\nDescription: $description\nPrice: $price';
  }
  

}
  

class ProductManager{
  List <Product> products = [];

  void addProduct(Product product){
    products.add(product);

  }

  List <Product> viewAllProdcuts(){
    return products;
  }

  void viewProduct(int index) {
    if (index >= 0 && index < products.length){
      print(products[index]);
    
    }
    else{
      print('Product not found.');
    }

  }

  void editProduct(int index, Product updatedProdcut){
    if (index >= 0 && index < products.length){
      products[index] = updatedProdcut;
      print('Product successfully edited.');
    }

    else{
      print('Product not found.');
    }
    
  }

  void deleteProduct(int index){
    if (index >= 0 && index < products.length){
      products.removeAt(index);
      print('Product successfully deleted.');
    }

    else{
      print('Product not found.');
    }
  }
}
  
void main(){
  ProductManager productManager = ProductManager();

  bool flag = true;

  while (flag){
    print('Welcome, please choose one of the following:');
    print('1. Add a new product');
    print('2. View all products');
    print('3. View a single product');
    print('4. Edit a product');
    print('5. Delete a product');
    print('6. Exit');
    print('Enter your choice: ');
    String choice = stdin.readLineSync()!;
    switch (choice){
      case '1':
        addProduct(productManager);
        break;
      case '2':
        viewAllProducts(productManager);
        break;
      case '3':
        viewSingleProduct(productManager);
        break;
      case '4':
        editProduct(productManager);
        break;
      case '5':
        deleteProduct(productManager);
        break;
      case '6':
        flag = false;
        break;
      default:
      print('Invalid choice. Please enter a number between 1 and 6.');
      }

    }
  }



void addProduct(ProductManager productManager){
  print('Enter the prodcut name:');
  String name = stdin.readLineSync()!;

  print('Enter a short description:');
  String description = stdin.readLineSync()!;

  print('Enter the price:');
  var val = stdin.readLineSync()!;
  double price = double.parse(val);

  
  Product newProdcut = Product(name, description, price);

  productManager.addProduct(newProdcut);
  print('Product added successfully.');
  

}

void viewAllProducts(ProductManager productManager) {
  List<Product> products = productManager.viewAllProdcuts();
  if (products.isEmpty) {
    print('No products available.');
  } else {
    for (int i = 0; i < products.length; i++) {
      print('Product ${i + 1}:\n${products[i]}\n');
    }
  }
}

void viewSingleProduct(ProductManager productManager) {
  print('Enter the product number to view: ');
  int index = int.parse(stdin.readLineSync()!) - 1;
  productManager.viewProduct(index);
}

void editProduct(ProductManager productManager){
  print('Enter the prodcut number to edit: ');
  var idx = stdin.readLineSync()!;
  int index = int.parse(idx) - 1;

  print('Enter the new prodcut name:');
  String name = stdin.readLineSync()!;

  print('Enter a short description:');
  String description = stdin.readLineSync()!;

  print('Enter the price:');
  var val = stdin.readLineSync()!;
  double price = double.parse(val);

  Product updatedProduct = Product(name, description, price);
  productManager.editProduct(index, updatedProduct);

}


void deleteProduct(ProductManager productManager) {
  print('Enter the product number to delete: ');
  int index = int.parse(stdin.readLineSync()!) - 1;
  productManager.deleteProduct(index);
}

