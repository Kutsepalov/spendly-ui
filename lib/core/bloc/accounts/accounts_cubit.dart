import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spendly/core/services/account_service.dart';
import 'package:spendly/models/account.dart';

part 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  final AccountService _accountService = AccountService();

  AccountsCubit() : super(const AccountsLoading([]));

  void changeState() async {
    AccountsState state = const AccountsLoading([]);
    List<Account> accounts = [];
    try {
      accounts = await _accountService.getAll();
      state = AccountsLoaded(accounts);
    } catch (e) {
      state = AccountsLoadingError(accounts);
    }
    emit(state);
  }
}
