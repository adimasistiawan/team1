class Dashboard {
  String tgl;
  String boxCountTeam;
  String boxCountTaskReport;
  String labelCountHariKerja;
  String labelCountCheckinWfh;
  List<int> datasetApproved;
  String boxCount2Approved;
  List<int> datasetRejected;
  String boxCount2Ditolak;
  List<int> datasetWaiting;
  String boxCount2MenungguValidasi;
  String boxCount2TotalPekerjaan;

  Dashboard(
      {this.tgl,
      this.boxCountTeam,
      this.boxCountTaskReport,
      this.labelCountHariKerja,
      this.labelCountCheckinWfh,
      this.datasetApproved,
      this.boxCount2Approved,
      this.datasetRejected,
      this.boxCount2Ditolak,
      this.datasetWaiting,
      this.boxCount2MenungguValidasi,
      this.boxCount2TotalPekerjaan});

  Dashboard.fromJson(Map<String, dynamic> json) {
    tgl = json['tgl'];
    boxCountTeam = json['box_count_team'];
    boxCountTaskReport = json['box_count_task_report'];
    labelCountHariKerja = json['label_count_hari_kerja'];
    labelCountCheckinWfh = json['label_count_checkin_wfh'];
    datasetApproved = json['dataset_approved'].cast<int>();
    boxCount2Approved = json['box_count2_approved'];
    datasetRejected = json['dataset_rejected'].cast<int>();
    boxCount2Ditolak = json['box_count2_ditolak'];
    datasetWaiting = json['dataset_waiting'].cast<int>();
    boxCount2MenungguValidasi = json['box_count2_menunggu_validasi'];
    boxCount2TotalPekerjaan = json['box_count2_total_pekerjaan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tgl'] = this.tgl;
    data['box_count_team'] = this.boxCountTeam;
    data['box_count_task_report'] = this.boxCountTaskReport;
    data['label_count_hari_kerja'] = this.labelCountHariKerja;
    data['label_count_checkin_wfh'] = this.labelCountCheckinWfh;
    data['dataset_approved'] = this.datasetApproved;
    data['box_count2_approved'] = this.boxCount2Approved;
    data['dataset_rejected'] = this.datasetRejected;
    data['box_count2_ditolak'] = this.boxCount2Ditolak;
    data['dataset_waiting'] = this.datasetWaiting;
    data['box_count2_menunggu_validasi'] = this.boxCount2MenungguValidasi;
    data['box_count2_total_pekerjaan'] = this.boxCount2TotalPekerjaan;
    return data;
  }
}
