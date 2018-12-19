package model;

import java.sql.Date;
import java.sql.Time;

public class KyThi {
	
	private String maDe;
	private String phongThi;
	private String lopThi;
	public KyThi() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KyThi(String maDe, Time thoiGian, Date ngayThi, String phongThi, String lopThi) {
		super();
		this.maDe = maDe;
		this.phongThi = phongThi;
		this.lopThi = lopThi;
	}
	public String getMaDe() {
		return maDe;
	}
	public void setMaDe(String maDe) {
		this.maDe = maDe;
	}
	public String getPhongThi() {
		return phongThi;
	}
	public void setPhongThi(String phongThi) {
		this.phongThi = phongThi;
	}
	public String getLopThi() {
		return lopThi;
	}
	public void setLopThi(String lopThi) {
		this.lopThi = lopThi;
	}
}
