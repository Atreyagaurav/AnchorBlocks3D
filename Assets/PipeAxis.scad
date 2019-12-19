//c1=cylinder(h=10,r1=1,r2=1,center=true,$fn=100);
//c2=cylinder(h=10,r1=0.9,r2=0.9,center=true,$fn=100);
//rotate()

   vec_length = 20;
   txt_size=4;
   dim_length= vec_length+txt_size;
   x=1;
   y=1;
  z= -.2;
  l= sqrt(x*x+y*y+z*z);
  lp= sqrt(x*x+y*y);
  i=x/l;
  j=y/l;
  k=z/l;
  pi=x/lp;
  pj=y/lp;
  r2i=z/l*pj;
  r2j=z/l*pi;
  r2k=-lp/l;
  //[0,0,1]
  //[px,py,0]
  //-py i px j
  r3i=-pj;
  r3j=pi;
  echo([i,j,k]);
alpha=acos(i);
beta=acos(j);
gamma=acos(k);
  echo([alpha,beta,gamma]);
  module cylin(rad,l){
color("grey"){
difference(){
    cylinder(h=l,r1=rad,r2=rad,center=false,$fn=100);
    cylinder(h=l+1,r1=0.95*rad,r2=0.95*rad,center=false,$fn=100);
   }}};
  

 module VecArrow(col,leng) { 
      color(col) {
     union(){
   cylinder(h=leng,r1=0.1*txt_size,r2=0.1*txt_size,center=false,$fn=40);
       translate([0,0,vec_length]){
   cylinder(h=1*txt_size,r1=0.2*txt_size,r2=0,center=false,$fn=40);
       }
   }}};
   
  module OrdinateAxis(col) {
   VecArrow(col,vec_length);
   rotate([0,90,0]){
   VecArrow(col,vec_length);
   }
   rotate([90,0,0]){
   VecArrow(col,vec_length);
   }};
  
   
   rotate(-90,[0,0,1]){ rotate(-gamma,[pi,pj,0]){ cylin(1.5,10);}};
  //k
   //text("k")
   //color("orange"){
//translate([0,-1.5*txt_size,dim_length*1]){ text("k",size=txt_size);}}
   color("orange"){
translate([0,-1.5*txt_size,dim_length*1]){  rotate([90,0,0]){
    text("k",size=txt_size);}}}
rotate([0,0,0]){  VecArrow("orange",vec_length);}
//j
color("red"){
translate([2,dim_length*1,3]){
    rotate([90,0,0]){
    text("j",size=txt_size);}}}
rotate([-90,0,0]){  VecArrow("red",vec_length);}
//i
color("red"){
translate([dim_length*1,0,0]){ 
     rotate([90,0,0]){
         text("i",size=txt_size);}}}
rotate([0,90,0]){  VecArrow("red",vec_length);}
   

//r3
color("green"){
translate([dim_length*r3i,dim_length*r3j,2]){
    rotate([90,0,0]){
        text("r3",size=txt_size);}}}
rotate(-90,[pi,pj,0]){  VecArrow("green",vec_length);}
//rp
color("yellow"){
translate([dim_length*pi-1.5*txt_size,dim_length*pj+.5*txt_size,2]){
    rotate([90,0,0]){
        text("rp",size=txt_size);}}}
rotate(-90,[0,0,1]){rotate(-90,[pi,pj,0]){  VecArrow("yellow",vec_length);}}
//r1
color("blue"){
translate([dim_length*i,dim_length*j,dim_length*k-1]){
    rotate([90,0,0]){
        text("r1",size=4);}}}
rotate(-90,[0,0,1]){rotate(-gamma,[pi,pj,0]){  VecArrow("blue",vec_length);}}
//r2
color("blue"){
translate([dim_length*r2i*2,dim_length*r2j*3,dim_length*r2k]){ 
     rotate([90,0,0]){
         text("r2",size=txt_size);}}}
rotate(180,[i,j,k]){  VecArrow("blue",vec_length);}
//rotate([90,0,z+90]){  VecArrow("green",vec_length);}
//rotate(90,[0,0,0]){  VecArrow("green",vec_length);}
//rotate([x,y,z-90]){  VecArrow("blue",vec_length);}
  
 //  OrdinateAxis("blue");
//rotate([20,30,-20]){   OrdinateAxis("red");}
//rotate([10,12,90]){   OrdinateAxis("green");}

color("blue"){
translate([130,80,-1.4]){ 
     rotate([90,0,0]){
         text("Local I (r1, r2, r3)",size=txt_size);}}}
translate([100,100,0]){rotate(90,[0,1,0]){  VecArrow("blue",vec_length);}  }
color("yellow"){
translate([130,80,-11.4]){ 
     rotate([90,0,0]){
         text("Local II (rp, r3, k)",size=txt_size);}}}
translate([100,100,-10]){rotate(90,[0,1,0]){  VecArrow("yellow",vec_length);}  }
color("red"){
translate([130,80,-21.4]){ 
     rotate([90,0,0]){
         text("Global (i, j, k)",size=txt_size);}}}
translate([100,100,-20]){rotate(90,[0,1,0]){  VecArrow("red",vec_length);}  }