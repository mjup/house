package ssm.bean;

import org.omg.CORBA.PRIVATE_MEMBER;

/*
 *王钢旗
 *2017年4月21日
 */
public class Price extends Base {
	private String month;
	private Double waterprice;
	private Double electricPrice;
	private Double gasPrice;
	private Double wuyePrice;
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Double getWaterprice() {
		return waterprice;
	}
	public void setWaterprice(Double waterprice) {
		this.waterprice = waterprice;
	}
	public Double getElectricPrice() {
		return electricPrice;
	}
	public void setElectricPrice(Double electricPrice) {
		this.electricPrice = electricPrice;
	}
	public Double getGasPrice() {
		return gasPrice;
	}
	public void setGasPrice(Double gasPrice) {
		this.gasPrice = gasPrice;
	}
	public Double getWuyePrice() {
		return wuyePrice;
	}
	public void setWuyePrice(Double wuyePrice) {
		this.wuyePrice = wuyePrice;
	}
}
