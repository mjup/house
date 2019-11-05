package ssm.bean;
/*
 *王钢旗
 *2017年4月24日
 */
public class Charge extends Base {
	
	private String houseid;
	private String month;
	private Double water;
	private Double electric;
	private Double wuye;
	private Double gas;
	private Integer status;
	private String rname;
	private String means;
	private String cdate;
	public String getHouseid() {
		return houseid;
	}
	public void setHouseid(String houseid) {
		this.houseid = houseid;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Double getWater() {
		return water;
	}
	public void setWater(Double water) {
		this.water = water;
	}
	public Double getElectric() {
		return electric;
	}
	public void setElectric(Double electric) {
		this.electric = electric;
	}
	public Double getGas() {
		return gas;
	}
	public void setGas(Double gas) {
		this.gas = gas;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getMeans() {
		return means;
	}
	public void setMeans(String means) {
		this.means = means;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public Double getWuye() {
		return wuye;
	}
	public void setWuye(Double wuye) {
		this.wuye = wuye;
	}
}
