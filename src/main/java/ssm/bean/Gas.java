package ssm.bean;
/*
 *王钢旗
 *2017年4月24日
 */
public class Gas extends Base {
	private String houseid;
	private String floorid;
	private Double gas;
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
	public Double getGas() {
		return gas;
	}
	public void setGas(Double gas) {
		this.gas = gas;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
}
