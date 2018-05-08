function [x,y]=map_tan(lat,lon)
% ���в��γ�߶�Բ׶ͶӰ Polyconic Projection with Meridional Intervals on Decrease Away From Central Meridian by Tangent

r=637111600;%��������뾶
scale=14000000;%�����߷�ĸ

%�Ƕ�ת����
lat=deg2rad(lat);
lon=deg2rad(lon);

%�������뾭���ϵ�ֱ������ֵx0/y0
x0=(lat+0.06683225*lat.^4)*r/scale;
y0=132/210/180*pi*1.1*(1-0.10096478*tan(lon/5))*lon;

%�����Ե�����ϵ�ֱ������ֵxn/yn
xn=x0+9.5493*lat;
yn=sqrt(112.^2-xn.^2)+20;

%���㼫�����/��
R=(yn.^2+(xn-x0).^2)/2/(xn-x0);
En=asin(yn/R);
lonn=pi;
E=En/lonn*1.1*(1-0.10096478*tan(lon/5))*lon;

%����ֱ������x/y
q=R+x0;
x=q-R*cos(E);
y=y0+R*sin(E);
end

