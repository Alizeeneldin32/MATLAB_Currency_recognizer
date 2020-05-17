function [val] = find_value(img)
count1=0;
count2=0;
count3=0;
count4=0;
count5=0;
count6=0;
count7=0;
count8=0;
count9=0;
count10=0;
count11=0;
count12=0;
count13=0;
count14=0;
count15=0;
count16=0;

summ=0;

%reading currencies images
p1=imread('0.5-back.jpg');

p2=imread('0.5-Front.jpg');

p3=imread('1-back.jpg');

p4=imread('1-Front.jpg');

p5=imread('5-back.jpg');

p6=imread('5-Front.jpg');

p7=imread('10-back.jpg');

p8=imread('10-Front.jpg');


p9=imread('20-back.jpg');

p10=imread('20-Front.jpg');

p11=imread('50-back.jpg');

p12=imread('50-Front.jpg');

p13=imread('100-back.jpg');

p14=imread('100-Front.jpg');

p15=imread('200-back.jpg');

p16=imread('200-Front.jpg');

[xs, ys , ~]=size(img);

%creating an array
p=zeros(xs,ys,16);
p(:,:,1)=imresize(p1(:,:,1),[xs,ys]);
p(:,:,2)=imresize(p2(:,:,1),[xs,ys]);
p(:,:,3)=imresize(p3(:,:,1),[xs,ys]);
p(:,:,4)=imresize(p4(:,:,1),[xs,ys]);
p(:,:,5)=imresize(p5(:,:,1),[xs,ys]);
p(:,:,6)=imresize(p6(:,:,1),[xs,ys]);
p(:,:,7)=imresize(p7(:,:,1),[xs,ys]);
p(:,:,8)=imresize(p8(:,:,1),[xs,ys]);
p(:,:,9)=imresize(p9(:,:,1),[xs,ys]);
p(:,:,10)=imresize(p10(:,:,1),[xs,ys]);
p(:,:,11)=imresize(p11(:,:,1),[xs,ys]);
p(:,:,12)=imresize(p12(:,:,1),[xs,ys]);
p(:,:,13)=imresize(p13(:,:,1),[xs,ys]);
p(:,:,14)=imresize(p14(:,:,1),[xs,ys]);
p(:,:,15)=imresize(p15(:,:,1),[xs,ys]);
p(:,:,16)=imresize(p16(:,:,1),[xs,ys]);

%acquiring the histogram of the input image
[c,n]=imhist(img(:,:,1));


index=0;

c=c/xs/ys;

%looping on the currencies images and comparing each histogram to the input
%histogram
for i=1:16
    
    [z,~]=imhist(uint8(p(:,:,i)));
    z=z/xs/ys;
    
    
    %finding the minimum difference between the input histogram and the
    %currencies histogram
    temp=pdist2(c',z','cosine');
    
    
    if temp==0
        index=i;
    end
    
end
%finding the value of the index and outputting the right currency
if index==1
        disp('0.5 LE')
        count1=count1+1;
            
elseif index==2
        disp('0.5 LE')
        count2=count2+1;
elseif index==3
        disp('1 LE')
        count3=count3+1;
elseif index==4
        disp('1 LE')
        count4=count4+1;
elseif index==5
        disp('5 LE')
        count5=count5+1;
elseif index==6
        disp('5 LE')
        count6=count6+1;
elseif index==7
        disp('10 LE')
        count7=count7+1;
elseif index==8
        disp('10 LE')
        count8=count8+1;
elseif index==9
        disp('20 LE')
        count9=count9+1;
elseif index==10
        disp('20 LE')
        count10=count10+1;
elseif index==11
        disp('50 LE')
        count11=count11+1;
elseif index==12
        disp('50 LE')
        count12=count12+1;
elseif index==13
        disp('100 LE')
        count13=count13+1;
elseif index==14
        disp('100 LE')
        count14=count14+1;
elseif index==15
        disp('200 LE')
        count15=count15+1;
elseif  index==16
        disp('200 LE')
        count16=count16+1;
else
        disp('Value Not Found')
end
summ=count1*0.5+count2*0.5+count3*1+count4*1+count5*5+count6*5+count7*10+count8*10+count9*20+count10*20+count11*50+count12*50+count13*100+count14*100+count15*200+count16*200;
 disp('total value equals')
 disp(summ)
        
end