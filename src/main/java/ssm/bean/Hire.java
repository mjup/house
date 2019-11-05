package ssm.bean;

import java.util.Date;

/*
 *王钢旗
 *2017年4月18日
 */
public class Hire extends Base {
	private Integer pid;
	private String hname;
	private String houseid;
	private String hphone;
	private Double hcharge;
	private String startdate;
	private Integer lease;
	private String rname;
	private String tdate;
	private String descr;
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHphone() {
		return hphone;
	}
	public String getHouseid() {
		return houseid;
	}
	public void setHouseid(String houseid) {
		this.houseid = houseid;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public Double getHcharge() {
		return hcharge;
	}
	public void setHcharge(Double hcharge) {
		this.hcharge = hcharge;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	public Integer getLease() {
		return lease;
	}
	public void setLease(Integer lease) {
		this.lease = lease;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
}
