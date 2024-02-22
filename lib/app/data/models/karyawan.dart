// To parse this JSON data, do
//
//     final karyawan = karyawanFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Karyawan karyawanFromJson(String str) => Karyawan.fromJson(json.decode(str));

String karyawanToJson(Karyawan data) => json.encode(data.toJson());

List<Karyawan> listKaryawanFromJson(String str) =>
    List<Karyawan>.from(json.decode(str).map((x) => Karyawan.fromJson(x)));

String listKaryawanToJson(List<Karyawan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Karyawan extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? nomorIndukKaryawan;
  final String? namaLengkap;
  final String? namaPanggilan;
  final String? noIdentitas;
  final DateTime? tglLahir;
  final String? agama;
  final String? gender;
  final String? statusPernikahan;
  final String? alamat;
  final String? rt;
  final String? rw;
  final String? desa;
  final String? kecamatan;
  final String? kota;
  final String? provinsi;
  final String? kodepos;
  final String? statusRumah;
  final String? noHp;
  final String? noTelp;
  final String? photo;
  final int? fkCabang;
  final int? fkBagian;
  final int? fkLevelJabatan;
  final String? statusKaryawan;
  final int? fkNamaPerusahaan;
  final DateTime? tahunGabung;
  final dynamic tahunKeluar;
  final int? fkUser;
  final String? jenisKaryawan;
  final dynamic upah;
  final String? tempatLahir;
  final String? expiredKontrak;
  final String? masaKerja;
  final String? alamatDomisili;
  final dynamic ptpkStatus;
  final dynamic pendidikanTerakhir;
  final dynamic grade;
  final dynamic namaInstitusi;
  final dynamic jurusan;
  final dynamic tahunMasukPendidikan;
  final dynamic tahunLulus;
  final dynamic gpa;
  final String? email;
  final dynamic kontakDarurat;
  final dynamic medsos;
  final dynamic npwp;
  final String? golonganDarah;
  final dynamic noRek1;
  final dynamic bank1;
  final dynamic noRek2;
  final dynamic bank2;
  final dynamic namaIbuKandung;
  final dynamic bpjsKesehatan;
  final dynamic keteranganBpjs;
  final dynamic noBpjsKesehatan;
  final dynamic bpjsTenagaKerja;
  final dynamic keteranganBpjsTenagaKerja;
  final dynamic noBpjsTenagaKerja;
  final dynamic jamkesLainnya;
  final dynamic noIjazah;
  final dynamic instansiIjazah;
  final dynamic noFinger;
  final dynamic brand;
  final dynamic vendor;
  final dynamic keterangan;
  final int? fkJenisKar;
  final dynamic expiredKontrakBaru;
  final dynamic tanggalPengangkatan;
  final dynamic menuAksesUpdate;
  final dynamic fkUserUpdate;
  final String? approvalVia;
  final Jabatan? jabatan;
  final Cabang? cabang;

  const Karyawan({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.nomorIndukKaryawan,
    this.namaLengkap,
    this.namaPanggilan,
    this.noIdentitas,
    this.tglLahir,
    this.agama,
    this.gender,
    this.statusPernikahan,
    this.alamat,
    this.rt,
    this.rw,
    this.desa,
    this.kecamatan,
    this.kota,
    this.provinsi,
    this.kodepos,
    this.statusRumah,
    this.noHp,
    this.noTelp,
    this.photo,
    this.fkCabang,
    this.fkBagian,
    this.fkLevelJabatan,
    this.statusKaryawan,
    this.fkNamaPerusahaan,
    this.tahunGabung,
    this.tahunKeluar,
    this.fkUser,
    this.jenisKaryawan,
    this.upah,
    this.tempatLahir,
    this.expiredKontrak,
    this.masaKerja,
    this.alamatDomisili,
    this.ptpkStatus,
    this.pendidikanTerakhir,
    this.grade,
    this.namaInstitusi,
    this.jurusan,
    this.tahunMasukPendidikan,
    this.tahunLulus,
    this.gpa,
    this.email,
    this.kontakDarurat,
    this.medsos,
    this.npwp,
    this.golonganDarah,
    this.noRek1,
    this.bank1,
    this.noRek2,
    this.bank2,
    this.namaIbuKandung,
    this.bpjsKesehatan,
    this.keteranganBpjs,
    this.noBpjsKesehatan,
    this.bpjsTenagaKerja,
    this.keteranganBpjsTenagaKerja,
    this.noBpjsTenagaKerja,
    this.jamkesLainnya,
    this.noIjazah,
    this.instansiIjazah,
    this.noFinger,
    this.brand,
    this.vendor,
    this.keterangan,
    this.fkJenisKar,
    this.expiredKontrakBaru,
    this.tanggalPengangkatan,
    this.menuAksesUpdate,
    this.fkUserUpdate,
    this.approvalVia,
    this.jabatan,
    this.cabang,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        nomorIndukKaryawan,
        namaLengkap,
        namaPanggilan,
        noIdentitas,
        tglLahir,
        agama,
        gender,
        statusPernikahan,
        alamat,
        rt,
        rw,
        desa,
        kecamatan,
        kota,
        provinsi,
        kodepos,
        statusRumah,
        noHp,
        noTelp,
        photo,
        fkCabang,
        fkBagian,
        fkLevelJabatan,
        statusKaryawan,
        fkNamaPerusahaan,
        tahunGabung,
        tahunKeluar,
        fkUser,
        jenisKaryawan,
        upah,
        tempatLahir,
        expiredKontrak,
        masaKerja,
        alamatDomisili,
        ptpkStatus,
        pendidikanTerakhir,
        grade,
        namaInstitusi,
        jurusan,
        tahunMasukPendidikan,
        tahunLulus,
        gpa,
        email,
        kontakDarurat,
        medsos,
        npwp,
        golonganDarah,
        noRek1,
        bank1,
        noRek2,
        bank2,
        namaIbuKandung,
        bpjsKesehatan,
        keteranganBpjs,
        noBpjsKesehatan,
        bpjsTenagaKerja,
        keteranganBpjsTenagaKerja,
        noBpjsTenagaKerja,
        jamkesLainnya,
        noIjazah,
        instansiIjazah,
        noFinger,
        brand,
        vendor,
        keterangan,
        fkJenisKar,
        expiredKontrakBaru,
        tanggalPengangkatan,
        menuAksesUpdate,
        fkUserUpdate,
        approvalVia,
        jabatan,
        cabang,
      ];

  factory Karyawan.fromJson(Map<String, dynamic> json) => Karyawan(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        nomorIndukKaryawan: json["nomor_induk_karyawan"],
        namaLengkap: json["nama_lengkap"],
        namaPanggilan: json["nama_panggilan"],
        noIdentitas: json["no_identitas"],
        tglLahir: json["tgl_lahir"] == null
            ? null
            : DateTime.parse(json["tgl_lahir"]),
        agama: json["agama"],
        gender: json["gender"],
        statusPernikahan: json["status_pernikahan"],
        alamat: json["alamat"],
        rt: json["rt"],
        rw: json["rw"],
        desa: json["desa"],
        kecamatan: json["kecamatan"],
        kota: json["kota"],
        provinsi: json["provinsi"],
        kodepos: json["kodepos"],
        statusRumah: json["status_rumah"],
        noHp: json["no_hp"],
        noTelp: json["no_telp"],
        photo: json["photo"],
        fkCabang: json["fk_cabang"],
        fkBagian: json["fk_bagian"],
        fkLevelJabatan: json["fk_level_jabatan"],
        statusKaryawan: json["status_karyawan"],
        fkNamaPerusahaan: json["fk_nama_perusahaan"],
        tahunGabung: json["tahun_gabung"] == null
            ? null
            : DateTime.parse(json["tahun_gabung"]),
        tahunKeluar: json["tahun_keluar"],
        fkUser: json["fk_user"],
        jenisKaryawan: json["jenis_karyawan"],
        upah: json["upah"],
        tempatLahir: json["tempat_lahir"],
        expiredKontrak: json["expired_kontrak"],
        masaKerja: json["masa_kerja"],
        alamatDomisili: json["alamat_domisili"],
        ptpkStatus: json["ptpk_status"],
        pendidikanTerakhir: json["pendidikan_terakhir"],
        grade: json["grade"],
        namaInstitusi: json["nama_institusi"],
        jurusan: json["jurusan"],
        tahunMasukPendidikan: json["tahun_masuk_pendidikan"],
        tahunLulus: json["tahun_lulus"],
        gpa: json["gpa"],
        email: json["email"],
        kontakDarurat: json["kontak_darurat"],
        medsos: json["medsos"],
        npwp: json["npwp"],
        golonganDarah: json["golongan_darah"],
        noRek1: json["no_rek1"],
        bank1: json["bank1"],
        noRek2: json["no_rek2"],
        bank2: json["bank2"],
        namaIbuKandung: json["nama_ibu_kandung"],
        bpjsKesehatan: json["bpjs_kesehatan"],
        keteranganBpjs: json["keterangan_bpjs"],
        noBpjsKesehatan: json["no_bpjs_kesehatan"],
        bpjsTenagaKerja: json["bpjs_tenaga_kerja"],
        keteranganBpjsTenagaKerja: json["keterangan_bpjs_tenaga_kerja"],
        noBpjsTenagaKerja: json["no_bpjs_tenaga_kerja"],
        jamkesLainnya: json["jamkes_lainnya"],
        noIjazah: json["no_ijazah"],
        instansiIjazah: json["instansi_ijazah"],
        noFinger: json["no_finger"],
        brand: json["brand"],
        vendor: json["vendor"],
        keterangan: json["keterangan"],
        fkJenisKar: json["fk_jenis_kar"],
        expiredKontrakBaru: json["expired_kontrak_baru"],
        tanggalPengangkatan: json["tanggal_pengangkatan"],
        menuAksesUpdate: json["menu_akses_update"],
        fkUserUpdate: json["fk_user_update"],
        approvalVia: json["approval_via"],
        jabatan:
            json["jabatan"] == null ? null : Jabatan.fromJson(json["jabatan"]),
        cabang: json["cabang"] == null ? null : Cabang.fromJson(json["cabang"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "nomor_induk_karyawan": nomorIndukKaryawan,
        "nama_lengkap": namaLengkap,
        "nama_panggilan": namaPanggilan,
        "no_identitas": noIdentitas,
        "tgl_lahir":
            "${tglLahir!.year.toString().padLeft(4, '0')}-${tglLahir!.month.toString().padLeft(2, '0')}-${tglLahir!.day.toString().padLeft(2, '0')}",
        "agama": agama,
        "gender": gender,
        "status_pernikahan": statusPernikahan,
        "alamat": alamat,
        "rt": rt,
        "rw": rw,
        "desa": desa,
        "kecamatan": kecamatan,
        "kota": kota,
        "provinsi": provinsi,
        "kodepos": kodepos,
        "status_rumah": statusRumah,
        "no_hp": noHp,
        "no_telp": noTelp,
        "photo": photo,
        "fk_cabang": fkCabang,
        "fk_bagian": fkBagian,
        "fk_level_jabatan": fkLevelJabatan,
        "status_karyawan": statusKaryawan,
        "fk_nama_perusahaan": fkNamaPerusahaan,
        "tahun_gabung": tahunGabung?.toIso8601String(),
        "tahun_keluar": tahunKeluar,
        "fk_user": fkUser,
        "jenis_karyawan": jenisKaryawan,
        "upah": upah,
        "tempat_lahir": tempatLahir,
        "expired_kontrak": expiredKontrak,
        "masa_kerja": masaKerja,
        "alamat_domisili": alamatDomisili,
        "ptpk_status": ptpkStatus,
        "pendidikan_terakhir": pendidikanTerakhir,
        "grade": grade,
        "nama_institusi": namaInstitusi,
        "jurusan": jurusan,
        "tahun_masuk_pendidikan": tahunMasukPendidikan,
        "tahun_lulus": tahunLulus,
        "gpa": gpa,
        "email": email,
        "kontak_darurat": kontakDarurat,
        "medsos": medsos,
        "npwp": npwp,
        "golongan_darah": golonganDarah,
        "no_rek1": noRek1,
        "bank1": bank1,
        "no_rek2": noRek2,
        "bank2": bank2,
        "nama_ibu_kandung": namaIbuKandung,
        "bpjs_kesehatan": bpjsKesehatan,
        "keterangan_bpjs": keteranganBpjs,
        "no_bpjs_kesehatan": noBpjsKesehatan,
        "bpjs_tenaga_kerja": bpjsTenagaKerja,
        "keterangan_bpjs_tenaga_kerja": keteranganBpjsTenagaKerja,
        "no_bpjs_tenaga_kerja": noBpjsTenagaKerja,
        "jamkes_lainnya": jamkesLainnya,
        "no_ijazah": noIjazah,
        "instansi_ijazah": instansiIjazah,
        "no_finger": noFinger,
        "brand": brand,
        "vendor": vendor,
        "keterangan": keterangan,
        "fk_jenis_kar": fkJenisKar,
        "expired_kontrak_baru": expiredKontrakBaru,
        "tanggal_pengangkatan": tanggalPengangkatan,
        "menu_akses_update": menuAksesUpdate,
        "fk_user_update": fkUserUpdate,
        "approval_via": approvalVia,
        "jabatan": jabatan?.toJson(),
        "cabang": cabang?.toJson(),
      };
}

class Cabang extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? nama;
  final String? kode;
  final String? alamat;
  final String? noHp;
  final String? noTelp;
  final int? fkNamaPerusahaan;
  final String? dokumen;
  final String? status;
  final String? latitude;
  final String? longitude;
  final String? radius;
  final String? satuanRadius;

  const Cabang({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.nama,
    this.kode,
    this.alamat,
    this.noHp,
    this.noTelp,
    this.fkNamaPerusahaan,
    this.dokumen,
    this.status,
    this.latitude,
    this.longitude,
    this.radius,
    this.satuanRadius,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        nama,
        kode,
        alamat,
        noHp,
        noTelp,
        fkNamaPerusahaan,
        dokumen,
        status,
        latitude,
        longitude,
        radius,
        satuanRadius,
      ];

  factory Cabang.fromJson(Map<String, dynamic> json) => Cabang(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        nama: json["nama"],
        kode: json["kode"],
        alamat: json["alamat"],
        noHp: json["no_hp"],
        noTelp: json["no_telp"],
        fkNamaPerusahaan: json["fk_nama_perusahaan"],
        dokumen: json["dokumen"],
        status: json["status"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        radius: json["radius"],
        satuanRadius: json["satuan_radius"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "nama": nama,
        "kode": kode,
        "alamat": alamat,
        "no_hp": noHp,
        "no_telp": noTelp,
        "fk_nama_perusahaan": fkNamaPerusahaan,
        "dokumen": dokumen,
        "status": status,
        "latitude": latitude,
        "longitude": longitude,
        "radius": radius,
        "satuan_radius": satuanRadius,
      };
}

class Jabatan extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final dynamic updatedAt;
  final String? nama;
  final String? kode;
  final String? status;
  final int? parentId;
  final int? paramLevel;

  const Jabatan({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.nama,
    this.kode,
    this.status,
    this.parentId,
    this.paramLevel,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        nama,
        kode,
        status,
        parentId,
        paramLevel,
      ];

  factory Jabatan.fromJson(Map<String, dynamic> json) => Jabatan(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        nama: json["nama"],
        kode: json["kode"],
        status: json["status"],
        parentId: json["parent_id"],
        paramLevel: json["param_level"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "nama": nama,
        "kode": kode,
        "status": status,
        "parent_id": parentId,
        "param_level": paramLevel,
      };
}
