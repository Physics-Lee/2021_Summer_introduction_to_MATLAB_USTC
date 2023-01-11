%Part1 录音
fs=8000;%采样率为8000
% lyx=audiorecorder(fs,8,2);%进行录音 %8为数字精度 %2为双声道 %lyx是我的姓名首字母缩写
% recordblocking(lyx,5);%录音时间设置为5s
% play(lyx);%播放
% y=getaudiodata(lyx);%把音频换为双精度数
[y,fs]=audioread('20210719.wav');
t=0+1/fs:1/fs:5;
plot(t,y);%横轴为时间，纵轴为声音强度的相对大小
% filename = '20210719.wav';
% audiowrite(filename,y,fs);

% %Part2 单元数组
% MyCellArray={lyx,y,'李懿轩','采样率=8000Hz','录制时间=5s'};
% 
% %Part3 结构体
% MyStructure.aduiorecorder=lyx;
% MyStructure.double=y;
% MyStructure.name='李懿轩';
% MyStructure.fs=8000;
% MyStructure.time=5;
% 
% %用单元数组、结构体来plot
% figure(2)
% plot(t,MyCellArray{1,2});
% figure(3)
% plot(t,MyStructure.double);