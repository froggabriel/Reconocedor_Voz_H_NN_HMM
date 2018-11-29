clc
clear
files = dir('muestras/*.wav');
for i = 1 : length(files)
    [s,fm] = audioread(strcat('muestras/',files(i).name));
    s = sum(s,2);
    mel = mfcc(s,fm);
	dlmwrite(strcat('mfcc/',files(i).name(1:end-3),'mfcc'),mel,' ');
end