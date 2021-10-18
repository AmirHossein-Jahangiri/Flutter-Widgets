import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();


  void _saveForm(){
    if(_form.currentState!.validate()){
      _form.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveForm,
        child: Icon(Icons.save),
        backgroundColor: Colors.deepPurple,
      ),
      body: Form(
        key: _form,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0
          ),
          children: [

            // user name user input
            UserInputWidget(
              label: 'User Name',
              textInputAction: TextInputAction.next,
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Please provide a value.';
                }else if(value.length <= 5){
                  return 'Please enter a valid user name greater than 5 characters.';
                }else {
                  return null;
                }
              },
            ),

            SizedBox(height: 10.0),

            // phone number user input
            UserInputWidget(
              label: 'Phone Number',
              textInputAction: TextInputAction.next,
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Please provide a value.';
                }else if(int.tryParse(value) == null){
                  return 'Please enter a phone number.';
                }else if(!value.startsWith('09')){
                  return 'Please enter a valid phone number.';
                }else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserInputWidget extends StatelessWidget {
  final String? label;
  final TextInputAction? textInputAction;
  final Function(String? value)? validator;

  const UserInputWidget({
    this.label,
    this.textInputAction,
    this.validator,
});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 25.0,
      style: TextStyle(
        color: Colors.deepPurple.shade900,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.deepPurple,
        ),
        prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurpleAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      textInputAction: textInputAction,
      validator: (String? value) => validator!(value),
    );
  }
}
