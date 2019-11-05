package ssm.bean;
/*
 *王钢旗
 *2017年4月24日
 */
public class Electric extends Base {
	private String houseid;
	private String floorid;
	private Double electric;
	private String month;
	public String getHouseid() {
		return houseid;
	}
	public void setHouseid(String houseid) {
		this.houseid = houseid;
	}
	public String getFloorid() {
		return floorid;
	}
	public void setFloorid(String floorid) {
		this.floorid = floorid;
	}
	public Double getElectric() {
		return electric;
	}
	public void setElectric(Double electric) {
		this.electric = electric;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
}
