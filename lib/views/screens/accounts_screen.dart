import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/core/bloc/accounts/accounts_cubit.dart';
import 'package:spendly/models/account.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountsCubit>(
      create: (context) => AccountsCubit()..changeState(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Accounts"),
        ),
        body: BlocBuilder<AccountsCubit, AccountsState>(
          builder: _blocBuilder,
        ),
      ),
    );
  }

  Widget _blocBuilder(BuildContext context, AccountsState state) {
    Widget widget = Container();
    if (state is AccountsLoading) {
      widget = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is AccountsLoadingError) {
      widget = const Center(
        child: Text("Failed to load accounts",
            style: TextStyle(color: Colors.red)),
      );
    } else if (state is AccountsLoaded) {
      widget = ReorderableListView.builder(
        itemCount: state.accounts.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, state.accounts[index], index),
        onReorder: (int oldIndex, int newIndex) {
          //TODO Realize method
        },
      );
    }
    return widget;
  }

  Widget _itemBuilder(BuildContext context, Account account, int index) {
    return Card(
      key: ValueKey("$index"),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: account.color,
          child: const Icon(
            Icons.wallet_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(account.name),
        subtitle: Text("${account.currency}${account.amount}"),
      ),
    );
  }
}
