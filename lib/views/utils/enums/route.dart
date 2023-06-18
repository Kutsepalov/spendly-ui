enum RouteDirectory {
  root(directory: "/"),
  accounts(directory: "/accounts");

  const RouteDirectory({
    required this.directory,
  });

  final String directory;
}
