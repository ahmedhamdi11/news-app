String calculateTimeAgo(DateTime date) {
  Duration diff = DateTime.now().difference(date);
  if (diff.inDays > 365) {
    int years = (diff.inDays / 365).floor();
    return '$years years ago';
  } else if (diff.inDays > 30) {
    int months = (diff.inDays / 30).floor();
    return '$months months ago';
  } else if (diff.inDays > 0) {
    return '${diff.inDays} days ago';
  } else if (diff.inHours > 0) {
    return '${diff.inHours} hours ago';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes} minutes ago';
  } else {
    return 'Just now';
  }
}
