part of 'accounts_cubit.dart';

@immutable
abstract class AccountsState {
  final List<Account> accounts;

  const AccountsState(this.accounts);
}

class AccountsLoading extends AccountsState {
  const AccountsLoading(super.accounts);
}

class AccountsLoaded extends AccountsState {
  const AccountsLoaded(super.accounts);
}

class AccountsLoadingError extends AccountsState {
  const AccountsLoadingError(super.accounts);
}
