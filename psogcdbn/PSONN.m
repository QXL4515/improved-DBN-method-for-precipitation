clc;clear;close all;  
%% ³õÊ¼»¯ÖÖÈº  
f= @(x)x .* sin(x) .* cos(2 * x) - 2 * x .* sin(3 * x); % º¯Êý±í´ïÊ½  
figure(1);ezplot(f,[0,0.01,20]);  
N = 50;                         % ³õÊ¼ÖÖÈº¸öÊý  
d = 1;                          % ¿Õ¼äÎ¬Êý  
ger = 100;                      % ×î´óµü´ú´ÎÊý       
limit = [0, 20];                % ÉèÖÃÎ»ÖÃ²ÎÊýÏÞÖÆ  
vlimit = [-1, 1];               % ÉèÖÃËÙ¶ÈÏÞÖÆ  
w = 0.8;                        % ¹ßÐÔÈ¨ÖØ  
c1 = 0.5;                       % ×ÔÎÒÑ§Ï°Òò×Ó  
c2 = 0.5;                       % ÈºÌåÑ§Ï°Òò×Ó   
for i = 1:d  
    x = limit(i, 1) + (limit(i, 2) - limit(i, 1)) * rand(N, d);%³õÊ¼ÖÖÈºµÄÎ»ÖÃ  
end  
v = rand(N, d);                  % ³õÊ¼ÖÖÈºµÄËÙ¶È  
xm = x;                          % Ã¿¸ö¸öÌåµÄÀúÊ·×î¼ÑÎ»ÖÃ  
ym = zeros(1, d);                % ÖÖÈºµÄÀúÊ·×î¼ÑÎ»ÖÃ  
fxm = zeros(N, 1);               % Ã¿¸ö¸öÌåµÄÀúÊ·×î¼ÑÊÊÓ¦¶È  
fym = -inf;                      % ÖÖÈºÀúÊ·×î¼ÑÊÊÓ¦¶È  
hold on  
plot(xm, f(xm), 'ro');title('³õÊ¼×´Ì¬Í¼');  
figure(2)  
%% ÈºÌå¸üÐÂ  
iter = 1;  
record = zeros(ger, 1);          % ¼ÇÂ¼Æ÷  
while iter <= ger  
     fx = f(x) ; % ¸öÌåµ±Ç°ÊÊÓ¦¶È     
     for i = 1:N        
        if fxm(i) < fx(i)  
            fxm(i) = fx(i);     % ¸üÐÂ¸öÌåÀúÊ·×î¼ÑÊÊÓ¦¶È  
            xm(i,:) = x(i,:);   % ¸üÐÂ¸öÌåÀúÊ·×î¼ÑÎ»ÖÃ  
        end   
     end  
if fym < max(fxm)  
        [fym, nmax] = max(fxm);   % ¸üÐÂÈºÌåÀúÊ·×î¼ÑÊÊÓ¦¶È  
        ym = xm(nmax, :);      % ¸üÐÂÈºÌåÀúÊ·×î¼ÑÎ»ÖÃ  
 end  
    v = v * w + c1 * rand * (xm - x) + c2 * rand * (repmat(ym, N, 1) - x);% ËÙ¶È¸üÐÂ  
    % ±ß½çËÙ¶È´¦Àí  
    v(v > vlimit(2)) = vlimit(2);  
    v(v < vlimit(1)) = vlimit(1);  
    x = x + v;% Î»ÖÃ¸üÐÂ  
    % ±ß½çÎ»ÖÃ´¦Àí  
    x(x > limit(2)) = limit(2);  
    x(x < limit(1)) = limit(1);  
    record(iter) = fym;%×î´óÖµ¼ÇÂ¼  
%     x0 = 0 : 0.01 : 20;  
%     plot(x0, f(x0), 'b-', x, f(x), 'ro');title('×´Ì¬Î»ÖÃ±ä»¯')  
%     pause(0.1)  
    iter = iter+1;  
end  
figure(3);plot(record);title('ÊÕÁ²¹ý³Ì')  
x0 = 0 : 0.01 : 20;  
figure(4);plot(x0, f(x0), 'b-', x, f(x), 'ro');title('×îÖÕ×´Ì¬Î»ÖÃ')  
disp(['×î´óÖµ£º',num2str(fym)]);  
disp(['±äÁ¿È¡Öµ£º',num2str(ym)]); 