Map = shaperead('landareas.shp','UseGeoCoords',true);%��ȡʸ�������ͼ
%geoshow(Map,'FaceColor',[0.7 0.7 0.7]);
layers=length(Map);%��ȡ���Գ���
for layer=1:layers
    xlength=length(Map(layer,1).Lat);%���������е�ĸ���
    for count=1:xlength
        lat=Map(layer,1).Lat(count);
        lon=Map(layer,1).Lon(count);%��ȡĳһ���Եľ�γ������

 [x,y]=map_tan(lat,lon);%���в��γ�߶�Բ׶ͶӰ
%[x,y]=map_equal(lat,lon);%�Ȳ��γ�߶�Բ׶ͶӰ
        Map(layer,1).Lat(count)=x;
        Map(layer,1).Lon(count)=y;
    end
end
geoshow(Map,'FaceColor',[0.7 0.7 0.7]);%��ʾͶӰ�任��ĵ�ͼ����
%shapewrite(Map,'worldmap_conversion_sin.shp');%������ͼ����
%shapewrite(Map,'worldmap_conversion_equ.shp');
