import 'package:dropdown_bloc/blocs/user_blocs/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_bloc/models/user_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserBloc _userBloc = UserBloc();
  final DataUser dataModel = DataUser();
  String? selectedValue = "Leanne Graham";

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dropdown'),
      ),
      body: _buildListWilayah(),
    );
  }

  Widget _buildListWilayah() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _userBloc,
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitial) {
                return _buildLoading();
              } else if (state is UserLoading) {
                return _buildLoading();
              } else if (state is UserLoaded) {
                return _buildCard(context, state.dataModel);
              } else if (state is UserError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, DataUser dataModel) {
    List<DropdownMenuItem<String>> menuItems = [];
    // for (var i = 0; i < userModel.values!.length; i++) {
    //   menuItems.add(
    //     DropdownMenuItem(
    //       child: Text("${userModel.values![i].name}"),
    //       value: "${userModel.values![i].name}",
    //     ),
    //   );
    // }

    return DropdownButton(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          print(selectedValue);
          selectedValue = newValue!;
        });
      },
      items: menuItems,
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
