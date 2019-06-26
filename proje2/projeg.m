
 resim1=imread('zeynep.png');
 
 resim=imresize(resim1, [240 320]);
 
 BB=step(FDetect,resim);
 figure,
 subplot(4,4,1);
 imshow(resim); hold on 
 for i=1:size(BB,1)
     rectangle('Position',BB(i,:),'LineWidth','-','EdgeColor','r');
 end
 title('yüz belirlendi');
 hold off;
 