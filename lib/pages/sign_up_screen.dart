import 'package:form_validation/exports.dart';

final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _directionController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _strongPasswordController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  // final TextEditingController _defaultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _signUpFormKey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              UserInputTextField(
                controller: _firstnameController,
                hintText: 'first name',
                outlineBorder: true,
                validationType: 'stringName',
                validatorMsg: 'Enter a valid first name',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                controller: _lastNameController,
                hintText: 'last name',
                outlineBorder: true,
                validationType: 'stringName',
                validatorMsg: 'Enter a valid last name',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                controller: _emailController,
                hintText: 'email',
                outlineBorder: true,
                validationType: 'email',
                validatorMsg: 'Enter a valid email',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                controller: _phoneController,
                keyboardType: 'number',
                hintText: 'phone',
                outlineBorder: true,
                validationType: 'phoneNumber',
                validatorMsg: 'Enter a valid phone number',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                controller: _cityController,
                hintText: 'city',
                outlineBorder: true,
                validationType: 'stringName',
                validatorMsg: 'Enter a valid city',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                controller: _passwordController,
                hintText: 'password',
                outlineBorder: true,
                validationType: 'password',
                validatorMsg: 'Enter a valid password',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                controller: _addressController,
                hintText: 'address',
                outlineBorder: true,
                validationType: 'anyString',
                validatorMsg: 'Enter a valid address',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                controller: _directionController,
                hintText: 'direction',
                outlineBorder: true,
                validationType: 'anyString',
                validatorMsg: 'Enter a valid direction',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                controller: _houseNumberController,
                hintText: 'houseNumber',
                outlineBorder: true,
                validationType: 'anyString',
                validatorMsg: 'Enter a valid houseNumber',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                //strongPassword
                controller: _strongPasswordController,
                hintText: 'strongPassword',
                outlineBorder: true,
                validationType: 'strongPassword',
                // validatorMsg: 'Enter a valid strongPassword',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              UserInputTextField(
                //strongPassword
                controller: _postalCodeController,
                hintText: 'postalCode',
                outlineBorder: true,
                validationType: 'postalCode',
                validatorMsg: 'Enter a valid postal Code',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              SizedBox(height: 20),
              // UserInputTextField(
              //   controller: _defaultController,
              //   hintText: 'default',
              //   outlineBorder: true,
              //   validationType: 'default',
              //   validatorMsg: 'default',
              //   contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ElevatedButton(
              onPressed: () {
                if (_signUpFormKey.currentState?.validate() == true) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } else {
                  var snackBar = SnackBar(
                    content: Text('All fields are required'),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.grey),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                minimumSize: WidgetStateProperty.all<Size>(
                  Size(MediaQuery.of(context).size.width, 50),
                ), // Width and height
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: Text('Sign In'),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
