% Save & Load file

%1
A=[1, 2, 3];
B=[4, 5, 6];
save('ACE_LAB_EXP_1\savefile.mat','A','B');

%2
load('ACE_LAB_EXP_1\savefile.mat');
C=[11,10,101];
save('ACE_LAB_EXP_1\savefile.mat','C','-append');

%3
%disp(A);
%disp(B);
%disp(C);

%4-5
friends=["Archie","Harshil","Himanshu";
            "26","26","27"];
filename='ACE_LAB_EXP_1\friends_info.xlsx';
writematrix(friends,filename);

readmatrix("ACE_LAB_EXP_1\friends_info.xlsx");
sum=0.00;
for i=1:3
    n=str2double(friends(end,i));
    sum=sum+n;
    n=0;
end
avg=sum/3;

%6-7
[y,Fs]=audioread('ACE_LAB_EXP_1\Alok & Dynoro - On & On [hithotmusic] House my-free-mp3s.com .mp3');

startSample=1000;
endSample=2000;
portion=y(startSample:endSample,:);
audiowrite('ACE_LAB_EXP_1\portion.mp3',portion,Fs);

%8-9
[img,Fs]=imread('ACE_LAB_EXP_1\sk-CNBRg1K9QvQ-unsplash.jpg');
%disp(image(img));

%10
imgF1=img;
imgF2=img;
imgF3=img;

imgF1(:,:,1)=0;
%disp(image(imgF1));

imgF2(:,:,2)=0;
%disp(image(imgF2));

imgF3(:,:,3)=0;
%disp(image(imgF3));



