import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/category.dart';
import 'package:pfa_frontend/services/admin/category_service.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryService _categoryService = CategoryService();

  late Future<List<Category>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _categoryService.fetchCategories();
    print(_categoriesFuture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Category>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No categories found.'));
          } else {
            List<Category> categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(categories[index].name),
                    subtitle: Text(categories[index].courseNumber.toString()),
                    trailing:
                        Icon(IconData(0xe55a, fontFamily: 'MaterialIcons')));
              },
            );
          }
        },
      ),
    );
  }
}

//   void _navigateToCategoryCreateScreen(CategoryService categoryService) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CategoryCreateScreen(
//           categoryService: categoryService,
//         ),
//       ),
//     ).then((_) {
//       setState(() {
//         _categoriesFuture = categoryService.fetchCategories();
//       });
//     });
//   }

//   void _navigateToCategoryEditScreen(
//       CategoryService categoryService, Category category) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CategoryEditScreen(
//           categoryService: categoryService,
//           category: category,
//         ),
//       ),
//     ).then((_) {
//       setState(() {
//         _categoriesFuture = categoryService.fetchCategories();
//       });
//     });
//   }

//   void _handleDeleteCategory(int categoryId) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Delete Category'),
//         content: Text('Are you sure you want to delete this category?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () async {
//               await _categoryService.deleteCategory(categoryId);
//               setState(() {
//                 _categoriesFuture = _categoryService.fetchCategories();
//               });
//               Navigator.pop(context);
//             },
//             child: Text('Delete'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CategoryCreateScreen extends StatefulWidget {
//   final CategoryService categoryService;

//   const CategoryCreateScreen({Key? key, required this.categoryService})
//       : super(key: key);

//   @override
//   _CategoryCreateScreenState createState() => _CategoryCreateScreenState();
// }

// class _CategoryCreateScreenState extends State<CategoryCreateScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _iconController = TextEditingController();
//   late File _image;

//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Category'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               _image != null
//                   ? Image.file(
//                       _image,
//                       height: 100,
//                     )
//                   : ElevatedButton(
//                       onPressed: _getImage,
//                       child: Text('Select Image'),
//                     ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: _iconController,
//                 decoration: InputDecoration(labelText: 'Icon'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an icon';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     Category category = Category(
//                       name: _nameController.text,
//                       icon: _iconController.text, // Using icon text value here
//                       image: _image.path, // Using image file path here
//                     );
//                     widget.categoryService.createCategory(category).then((_) {
//                       Navigator.pop(context);
//                     });
//                   }
//                 },
//                 child: Text('Create'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoryEditScreen extends StatefulWidget {
//   final CategoryService categoryService;
//   final Category category;

//   const CategoryEditScreen(
//       {Key? key, required this.categoryService, required this.category})
//       : super(key: key);

//   @override
//   _CategoryEditScreenState createState() => _CategoryEditScreenState();
// }

// class _CategoryEditScreenState extends State<CategoryEditScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _iconController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _nameController.text = widget.category.name;
//     _iconController.text = widget.category.icon;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Category'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _iconController,
//                 decoration: InputDecoration(labelText: 'Icon'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an icon';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     Category updatedCategory = Category(
//                       id: widget.category.id,
//                       name: _nameController.text,
//                       icon: _iconController.text,
//                       courseNumber: widget.category
//                           .courseNumber, // You may add more fields here
//                       image:
//                           widget.category.image, // You may add more fields here
//                       createdAt: widget
//                           .category.createdAt, // You may add more fields here
//                       updatedAt: widget
//                           .category.updatedAt, // You may add more fields here
//                     );
//                     widget.categoryService
//                         .updateCategory(updatedCategory)
//                         .then((_) {
//                       Navigator.pop(context);
//                     });
//                   }
//                 },
//                 child: Text('Update'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }












// // screens/category_list_screen.dart
// import 'package:flutter/material.dart';
// import 'package:pfa_frontend/models/category.dart';
// import 'package:pfa_frontend/services/category_service.dart';

// class CategoryListScreen extends StatelessWidget {
//   final CategoryService _categoryService = CategoryService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//       ),
//       body: FutureBuilder<List<Category>>(
//         future: _categoryService.fetchCategories(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No categories found.'));
//           } else {
//             List<Category> categories = snapshot.data!;
//             return ListView.builder(
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(categories[index].name),
//                   subtitle: Text(categories[index].icon),
//                   // Display other category details as needed
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
