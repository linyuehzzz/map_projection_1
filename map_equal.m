function [x,y]=map_equal(lat,lon)
%等差分纬线多圆锥投影 Equivalent Difference Latitude Parallel Polyconic Projection

%中央经线为东经150°
if(lon<=-30)
	lon=lon+210;
else
	lon=lon-150;
end

%角度转弧度
lat=deg2rad(lat);
lon=deg2rad(lon);

%计算中央经线上的直角坐标值x0/y0
x0=1.9499079012403E-5*lat^3+4.79161212198753*lat;
y0=0;

%计算边缘经线上的直角坐标值xn/yn
a1=2.81977572474422E-8;
a2=-0.000418283489244518;
xn=a1*lat^5+a2*lat^3+(514.633610723326/90-90^4*a1-90^2*a2)*lat;
b1=-2.44045034942499E-10;
b2=4.0096141899894E-6;
yn=b1*lat^6+b2*lat^4+(348.583307650471-715.2375-90^6*b1-90^4*b2)/90^2*lat^2+715.2375;

%计算极坐标ρ/δ
R=((yn-y0)^2+(xn-x0)^2)/(2*(xn-x0));
En=asin((yn-y0)/R);
C=0.0005050505;
b=1/(1-C*180);
E=En/180*b*(1-C*abs(lon))*(lon);

%计算直角坐标x/y
x=(x0+R*(1-cos(E)))*10;
y=(R*sin(E))*10;
end