enum SearchSort {
  popularWeek('popular-week'),
  popularToday('popular-today'),
  popular('popular'),
  recent('');

  const SearchSort(this.value);

  final String value;
}
