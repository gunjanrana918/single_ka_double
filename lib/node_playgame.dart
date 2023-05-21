class Nodeplaygame {
  late String cid;
  late String gid;
  late String bettingnumber;
  late String bettingamount;

  Nodeplaygame(
    this.cid,
    this.gid,
    this.bettingnumber,
    this.bettingamount,
  );

  Nodeplaygame.fromJson(
    String cid,
    String gid,
    String bettingnumber,
    String bettingamount,
  ) {
    this.cid = cid;
    this.gid = gid;
    this.bettingnumber = bettingnumber;
    this.bettingamount = bettingamount;
  }
}
