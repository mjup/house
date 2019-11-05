package ssm.bean;
/*
 *王钢旗
 *2017年4月18日
 */
public class ParkingSpace extends Base {
	private String location;
	private Double length;
	private Double width;
	private Integer status;
	private Integer maxyear;
	private Double charge;
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	private String note;
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
	public Double getWidth() {
		return width;
	}
	public void setWidth(Double width) {
		this.width = width;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getMaxyear() {
		return maxyear;
	}
	public void setMaxyear(Integer maxyear) {
		this.maxyear = maxyear;
	}
	public Double getCharge() {
		return charge;
	}
	public void setCharge(Double charge) {
		this.charge = charge;
	}
	
}
