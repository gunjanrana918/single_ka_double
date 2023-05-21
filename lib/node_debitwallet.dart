class Nodedebit {
  late String wid;
  late String cid;
  late String wcreatedate;
  late String wcoins;

  Nodedebit(this.wid, this.cid, this.wcreatedate, this.wcoins);

  Nodedebit.fromJson(
      String wid, String cid, String wcreatedate, String wcoins) {
    this.wid = wid;
    this.cid = cid;
    this.wcreatedate = wcreatedate;
    this.wcoins = wcoins;
  }
}
