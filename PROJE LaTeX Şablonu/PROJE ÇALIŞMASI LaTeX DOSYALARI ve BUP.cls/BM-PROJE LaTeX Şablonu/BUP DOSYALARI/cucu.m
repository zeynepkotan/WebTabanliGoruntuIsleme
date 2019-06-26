function output = cucu(a)
faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); 
%yüz bulma dedektörü oluþturuluyor
img=imread(a);
BB=step(faceDetector,img); 
%resimlerin x y eksenine göre 
%kordinatlarý BB deðiþkenine atýlýyor.
iimg = insertObjectAnnotation(img,'rectangle',BB,'Face'); 
%kordinatlardaki yüzler çerçeveye alýnýyor
N=size(BB,1); 
%BB deðiþkeninin satýr sayýsýný 
%N deðiþkinine atýlýr.
handles.N=N;
counter=1;
ksayisi=0;
for i=1:N
    face=imcrop(img,BB(i,:));
    baseDir  = 'C:\P\TestDatabase\'; 
    %kesilen yüzlerin atýlacaðý klasör
    newName  = [baseDir num2str(counter) '.png'];
    handles.face=face; 
    while exist(newName,'file')
        counter = counter + 1; 
%sayaç belirleyerek kesilen yüzlere 
%integer deðer vererek kaydedilir.
        newName = [baseDir num2str(counter) '.png']; 
    end
    ksayisi=ksayisi+1;
    fac=imresize(face,[200,180]);
%200-180 boyutundaki yüzler 
%imwrite ile kaydedilir.
    imwrite(fac,newName);
    output=ksayisi;
end    
end
