import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText ;
  final String labelText ;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller ;
  final String? Function(String?)? validator ;

  const CustomTextFormField(
      {super.key, required this.hintText, required this.labelText,  this.contentPadding = const EdgeInsets.all(16),
        this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(

          padding: const
          EdgeInsets.symmetric(horizontal: 16 ,vertical: 8),

      child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
              children: [

                Text(labelText,
                  style: Theme.of(context).textTheme.displaySmall,),

                   const SizedBox(height: 8),


                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    controller: controller,
                    validator: validator,
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: InputDecoration(
                      hintText: hintText,
                      contentPadding: contentPadding  ,
                    ),
                  ),

              ],
      ),
    );
  }
}
