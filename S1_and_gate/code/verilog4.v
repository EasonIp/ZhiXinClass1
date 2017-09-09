`timescale 1ns/1ps   //ESC 下面
module and_gate_tb;    //双击会选择空格间的字符串
//module and_gate_tb();  也行

	reg a;
	reg b;
	wire s;
	and_gate and_gate(
			.a(a),
			.b(b),
			.s(s)
			);
			//例化名字和top 模块名字建议用一样的
			initial
	begin
	a = 0;
	b = 1;
	#100    //延时100个时间单位
	a= 1;
	b = 1;
	#100
	//
	a= 0;
	b = 0;
	#100
	$stop;
	end

endmodulen