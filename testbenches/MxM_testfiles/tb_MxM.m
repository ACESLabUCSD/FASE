clc

W = 8;
M = 200; 
N = 100; 
P = 120; 

A = round((rand(M, N)-0.5)*(2^W-1));
X = round((rand(N, P)-0.5)*(2^W-1));
Y = zeros(M, P);

for p = 1:P
    for m = 1:M
        for n = 1:N
            Y(m, p) = floor((Y(m, p) + floor(A(m, n)*X(n, p)/(2^W)))/2);
%             disp([p, m, A(m, n), X(n, p), Y(m, p)]);
        end
    end
end

fidA = fopen(['A_', num2str(M), '_', num2str(N), '.hex'], 'wt');
for m = 1:M 
    for n = 1:N
        fprintf(fidA, [ndec2hex((A(m, n)), W), '\n']);
    end
end
fclose(fidA);

fidX = fopen(['X_', num2str(N), '_', num2str(P), '.hex'], 'wt');
for p = 1:P 
    for n = 1:N
        fprintf(fidX, [ndec2hex((X(n, p)), W), '\n']);
    end
end
fclose(fidX);

fidY = fopen(['Y_', num2str(M), '_', num2str(P), '.hex'], 'wt');
for p = 1:P
    for m = 1:M
        fprintf(fidY, [ndec2hex(Y(m, p), W), '\n']);
    end
end