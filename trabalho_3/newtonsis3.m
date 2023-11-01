function x = newtonsis3(xi, X, Y, f1, f2, f3)

    k = 0;
    delta_x = [1e-8; 1e-8; 1e-8];
    while max(abs(delta_x)) > 1e-10 && k < 1000
        k = k + 1;

        % Linha 1:
        A(1,1)=(f1([xi(1)+delta_x(1); xi(2)           ; xi(3)           ], X, Y)-f1(xi, X, Y))/delta_x(1);
        A(1,2)=(f1([xi(1)           ; xi(2)+delta_x(2); xi(3)           ], X, Y)-f1(xi, X, Y))/delta_x(2);
        A(1,3)=(f1([xi(1)           ; xi(2)           ; xi(3)+delta_x(3)], X, Y)-f1(xi, X, Y))/delta_x(3);
        % Linha 2:
        A(2,1)=(f2([xi(1)+delta_x(1); xi(2)           ; xi(3)           ], X, Y)-f2(xi, X, Y))/delta_x(1);
        A(2,2)=(f2([xi(1)           ; xi(2)+delta_x(2); xi(3)           ], X, Y)-f2(xi, X, Y))/delta_x(2);
        A(2,3)=(f2([xi(1)           ; xi(2)           ; xi(3)+delta_x(3)], X, Y)-f2(xi, X, Y))/delta_x(3);
        % Linha 3:
        A(3,1)=(f3([xi(1)+delta_x(1); xi(2)           ; xi(3)           ], X, Y)-f3(xi, X, Y))/delta_x(1);
        A(3,2)=(f3([xi(1)           ; xi(2)+delta_x(2); xi(3)           ], X, Y)-f3(xi, X, Y))/delta_x(2);
        A(3,3)=(f3([xi(1)           ; xi(2)           ; xi(3)+delta_x(3)], X, Y)-f3(xi, X, Y))/delta_x(3);

        B = -[f1(xi, X, Y); f2(xi, X, Y); f3(xi, X, Y)];
        
        delta_x = A \ B;
        x = xi + delta_x * 0.1;
        xi = x;
    end
    repeticoes_newtonsis3 = k
    delta_x

end
