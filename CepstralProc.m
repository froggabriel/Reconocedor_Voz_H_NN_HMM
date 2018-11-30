clc
clear
a_files = dir('muestras/a/*.wav');
e_files = dir('muestras/e/*.wav');
i_files = dir('muestras/i/*.wav');
o_files = dir('muestras/o/*.wav');
u_files = dir('muestras/u/*.wav');

mel = [];
output = [];
a_out = [1 0 0 0 0]';
e_out = [0 1 0 0 0]';
i_out = [0 0 1 0 0]';
o_out = [0 0 0 1 0]';
u_out = [0 0 0 0 1]';

for i = 1 : length(a_files)
    [s,fm] = audioread(strcat('muestras/a/',a_files(i).name));
    s = sum(s,2);
    this_mel = mfcc(s,fm)';
    mel = horzcat(mel, this_mel);
    [m,n] = size(this_mel);
    for j = 1 : n
        output = horzcat(output, a_out);
    end
	%dlmwrite(strcat('mfcc/',files(i).name(1:end-3),'mfcc'),mel,' ');
end
size(mel)
size(output)
for i = 1 : length(e_files)
    [s,fm] = audioread(strcat('muestras/e/',e_files(i).name));
    s = sum(s,2);
    this_mel = mfcc(s,fm)';
    mel = horzcat(mel, this_mel);
    [m,n] = size(this_mel);
    for j = 1 : n
        output = horzcat(output, e_out);
    end
	%dlmwrite(strcat('mfcc/',files(i).name(1:end-3),'mfcc'),mel,' ');
end
for i = 1 : length(i_files)
    [s,fm] = audioread(strcat('muestras/i/',i_files(i).name));
    s = sum(s,2);
    this_mel = mfcc(s,fm)';
    mel = horzcat(mel, this_mel);
    [m,n] = size(this_mel);
    for j = 1 : n
        output = horzcat(output, i_out);
    end
	%dlmwrite(strcat('mfcc/',files(i).name(1:end-3),'mfcc'),mel,' ');
end
for i = 1 : length(o_files)
    [s,fm] = audioread(strcat('muestras/o/',o_files(i).name));
    s = sum(s,2);
    this_mel = mfcc(s,fm)';
    mel = horzcat(mel, this_mel);
    [m,n] = size(this_mel);
    for j = 1 : n
        output = horzcat(output, o_out);
    end
	%dlmwrite(strcat('mfcc/',files(i).name(1:end-3),'mfcc'),mel,' ');
end
for i = 1 : length(u_files)
    [s,fm] = audioread(strcat('muestras/u/',u_files(i).name));
    s = sum(s,2);
    this_mel = mfcc(s,fm)';
    mel = horzcat(mel, this_mel);
    [m,n] = size(this_mel);
    for j = 1 : n
        output = horzcat(output, u_out);
    end
	%dlmwrite(strcat('mfcc/',files(i).name(1:end-3),'mfcc'),mel,' ');
end
size(mel)
size(output)