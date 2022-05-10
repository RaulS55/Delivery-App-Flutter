import 'package:deliveryproyect/src/ui/global_widgets/custom_form.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final Icon prefixIcon;
  final String? Function(String)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? labelText;

  const InputText(
      {Key? key,
      this.prefixIcon = const Icon(Icons.email_outlined),
      this.validator,
      this.obscureText = false,
      this.onChanged,
      this.onSubmitted,
      this.textInputAction,
      this.keyboardType,
      this.labelText})
      : super(key: key);

  @override
  State<InputText> createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String? _errorText = "";
  //bool _isOk = false;
  bool _obscureText = false;
  String? get errorText => _errorText;
  CustomFormState? _formState;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _formState = CustomForm.of(context);
      _formState?.register(this);
    });
  }

  @override
  void deactivate() {
    //Se invoca antes que se elimine el widget, Dispose cuando ya se elimino

    _formState?.remove(this);
    super.deactivate();
  }

  void _validate(String text) {
    if (widget.validator != null) {
      _errorText = widget.validator!(text);
      setState(() {});
      if (widget.onChanged != null) {
        widget.onChanged!(text);
      }
    }
  }

  void _visibilityChange() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        _validate(text);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? CupertinoButton(
                padding: const EdgeInsets.all(10),
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: _visibilityChange)
            : Icon(
                Icons.check_circle,
                color: _errorText == null ? primaryColor : Colors.grey,
              ),
      ),
      obscureText: _obscureText,
      onSubmitted: widget.onSubmitted, //Accion en el boton del teclado
      textInputAction: widget.textInputAction, //simbolo del boton del teclado
      keyboardType: widget.keyboardType, //Tipo de teclado
    );
  }
}
