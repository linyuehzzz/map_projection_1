Map = shaperead('landareas.shp','UseGeoCoords',true);%读取矢量世界地图
%geoshow(Map,'FaceColor',[0.7 0.7 0.7]);
layers=length(Map);%读取属性长度
for layer=1:layers
    xlength=length(Map(layer,1).Lat);%计算属性中点的个数
    for count=1:xlength
        lat=Map(layer,1).Lat(count);
        lon=Map(layer,1).Lon(count);%读取某一属性的经纬度坐标

 [x,y]=map_tan(lat,lon);%正切差分纬线多圆锥投影
%[x,y]=map_equal(lat,lon);%等差分纬线多圆锥投影
        Map(layer,1).Lat(count)=x;
        Map(layer,1).Lon(count)=y;
    end
end
geoshow(Map,'FaceColor',[0.7 0.7 0.7]);%显示投影变换后的地图数据
%shapewrite(Map,'worldmap_conversion_sin.shp');%导出地图数据
%shapewrite(Map,'worldmap_conversion_equ.shp');
