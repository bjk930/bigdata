package com.lect.ex1_square;
// 鳶徹走誤, 適掘什誤, 汽戚斗, 持失切敗呪, 五社球, settergetter
//main(); Square s =new Square()
//        Square s1 =new Square(10)
public class Square {
	private int side;
	public Square() {//持失切敗呪 : return type戚 蒸壱 適掘什誤引 旭精 敗呪  //public 適掘什誤() - 戚 敗呪澗 持繰馬檎 切疑生稽 脊径鞠嬢辞 食殿猿走亀 拙疑梅製. 
		//神献楕 原酔什 > source> generate constructor using superclass //幻鉦 古鯵痕呪 赤惟 (public Square(巷情亜))竺舛 暁澗 private Square馬檎 持失切敗呪 持失照喫.
		System.out.println("古鯵痕呪 蒸澗 持失切 敗呪 硲窒喫");
	}
	public Square(int side) {// 古鯵痕呪 赤澗 持失切 敗呪税 遂亀 : 汽戚斗 段奄鉢 //神献楕 原酔什 > source > generate constructor using field
		this.side =side; // side研 脊径馬檎 敗呪 鎧税 side研 胡煽 昔縦馬壱 益 陥製 適掘什 鎧税 side研 昔縦廃陥. 
                         // 益君糠稽 適掘什税 side研 紫遂馬形檎 this研 旋嬢層陥.
		System.out.println("古鯵痕呪 赤澗 持失切 敗呪 硲窒喫. side 段奄鉢敗");
	}
	public int area() {
		return side*side;
	}
	public void setSide(int side) {//Square s = new Square(); s.setside(10) s.getside()
		this.side=side;        //神献楕 原酔什 > source > generate settergetter 適遣 魁せせせせせせせせせせせせせせせせせせせせせせせせせせせせせせ
	}							//SetA 脊径板 ctrl+ space 切疑刃失, sysout ctrl +space櫛 搾汁馬陥.			
	public int getside() {//s.getside
		return side;		//SetG 珍闘継什凪戚什
	}

}
