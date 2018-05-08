function [x,y]=map_tan(lat,lon)
% 正切差分纬线多圆锥投影 Polyconic Projection with Meridional Intervals on Decrease Away From Central Meridian by Tangent

r=637111600;%地球球体半径
scale=14000000;%比例尺分母

%角度转弧度
lat=deg2rad(lat);
lon=deg2rad(lon);

%计算中央经线上的直角坐标值x0/y0
x0=(lat+0.06683225*lat.^4)*r/scale;
y0=132/210/180*pi*1.1*(1-0.10096478*tan(lon/5))*lon;

%计算边缘经线上的直角坐标值xn/yn
xn=x0+9.5493*lat;
yn=sqrt(112.^2-xn.^2)+20;

%计算极坐标ρ/δ
R=(yn.^2+(xn-x0).^2)/2/(xn-x0);
En=asin(yn/R);
lonn=pi;
E=En/lonn*1.1*(1-0.10096478*tan(lon/5))*lon;

%计算直角坐标x/y
q=R+x0;
x=q-R*cos(E);
y=y0+R*sin(E);
end

