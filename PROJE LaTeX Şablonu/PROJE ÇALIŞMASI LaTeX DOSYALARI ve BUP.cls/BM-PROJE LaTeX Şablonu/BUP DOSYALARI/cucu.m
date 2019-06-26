function output = cucu(a)
faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); 
%y�z bulma dedekt�r� olu�turuluyor
img=imread(a);
BB=step(faceDetector,img); 
%resimlerin x y eksenine g�re 
%kordinatlar� BB de�i�kenine at�l�yor.
iimg = insertObjectAnnotation(img,'rectangle',BB,'Face'); 
%kordinatlardaki y�zler �er�eveye al�n�yor
N=size(BB,1); 
%BB de�i�keninin sat�r say�s�n� 
%N de�i�kinine at�l�r.
handles.N=N;
counter=1;
ksayisi=0;
for i=1:N
    face=imcrop(img,BB(i,:));
    baseDir  = 'C:\P\TestDatabase\'; 
    %kesilen y�zlerin at�laca�� klas�r
    newName  = [baseDir num2str(counter) '.png'];
    handles.face=face; 
    while exist(newName,'file')
        counter = counter + 1; 
%saya� belirleyerek kesilen y�zlere 
%integer de�er vererek kaydedilir.
        newName = [baseDir num2str(counter) '.png']; 
    end
    ksayisi=ksayisi+1;
    fac=imresize(face,[200,180]);
%200-180 boyutundaki y�zler 
%imwrite ile kaydedilir.
    imwrite(fac,newName);
    output=ksayisi;
end    
end
