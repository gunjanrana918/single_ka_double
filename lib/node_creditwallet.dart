class Nodecredit {
  late String wid;
  late String cid;
  late String wcreatedate;
  late String wcoins;

  Nodecredit(this.wid, this.cid, this.wcreatedate, this.wcoins);

  Nodecredit.fromJson(
      String wid, String cid, String wcreatedate, String wcoins) {
    this.wid = wid;
    this.cid = cid;
    this.wcreatedate = wcreatedate;
    this.wcoins = wcoins;
  }
}
