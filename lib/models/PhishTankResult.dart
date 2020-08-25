class PhishTankResult {
  String _inDatabase, _verified, _valid;

  PhishTankResult(this._inDatabase, this._verified, this._valid);

  get inDatabase => this._inDatabase;
  get verified => this._verified;
  get valid => this._valid;
}
