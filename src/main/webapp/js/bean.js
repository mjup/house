/**
 * 一些实体类
 */
function House(id,account,descr,floorid,cellid,bdate,shape,area,owner,population,ownerphone,mdate){
	this.id=id;
	this.account=account;
	this.descr=descr;
	this.floorid=floorid;
	this.cellid=cellid;
	this.bdate=bdate;//建筑年代，80年代或者90年代
	this.shape=shape;//建筑风格
	this.area=area;//面积
	this.owner=owner;
	this.population=population;//房主家里人数
	this.ownerphone=ownerphone;
	this.mdate=mdate;//迁住日期
}
function Price(id,month,waterprice,electricPrice,gasPrice,wuyePrice){
	this.id = id;
	this.month = month;
	this.waterprice = waterprice;
	this.electricPrice = electricPrice;
	this.gasPrice = gasPrice;
	this.wuyePrice = wuyePrice;
}
function Dosage(account,yongliang,type){
	this.houseid = account;
//	name = yongliang;
	switch(type){
	case 1:this.water=yongliang;
		break;
	case 2:this.gas=yongliang;
		break;
	case 3:this.electric=yongliang;
		break;
	default:this.water=yongliang;
		break;
}
}
function Announce(id,title,tdate,content){
	this.id= id;
	this.title = title;
	this.tdate = tdate;
	this.content = content;
}