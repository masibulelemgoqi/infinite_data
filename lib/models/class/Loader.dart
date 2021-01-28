class Loader {
  bool isLoading;
  bool get getIsLoading => isLoading;

  set setIsLoading(bool isLoading) => this.isLoading = isLoading;
  Loader(this.isLoading);
}
