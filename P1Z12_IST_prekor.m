function [x,y,dy,ddy] = P1Z12_IST_prekor(a0,a1,a2,rhs,y0,dy0,a,b,n,kor,b2m)
% Projekt 1,zadanie 12
% Igor Staręga,320741
%
% Przybliżanie rozwiązania równania rózniczkowego drugiego stopnia przy
% użyciu metody Adamsa-Bashfortha-Moultona
%
% Wejście:
% a0 - uchwyt do funkcji będący współczynnikiem przy y w równaniu
% a1 - uchwyt do funkcji będący współczynnikiem przy y' w równaniu
% a2 - uchwyt do funkcji będący współczynnikiem przy y'' w równaniu
% (a0,a1,a2 to funkcje jednej zmiennej (np. x),natomiast poprawne a2
% nie powinno się zerować dla żadnego x)
% rhs - uchwyt do funkcji jednej zmiennej opisującej prawą strone równania
% y0 - wartość początkowa funkcji y równa y(a)
% dy0 - wartośc początkowa pierwszej pochodnej funkcji y równa y'(a)
% a - początek przedziału na którym wyznaczamy rozwiązanie równania
% b - koniec przedziału na którym wyznaczamy rozwiązanie równania
% n - liczba kroków wykonanych przez metodę
% kor - argument określający czy w metodzie ma byc użyty korektor
% (wartość 1) ,czy też nie (wartość 0) ,w przypadku wartości -1 metoda
% obliczy przybliżenie jedynie przy użyciu metody Rungego-Kutty
% b2m - opcjonalny (podstawowa wartośc: b2m = 1) argument okreslajacy ile razy
% metoda ma wykonać predykcję zanim dokona korekcji (np. b2m = 3 oznacza,
% że najpierw zostaną wykonane 3 iteracje metody Addams-Bashford,
% a dopiero po 3 iteracji metoda dokona korekcji)
%
% Wyjście:
% x - wektor n + 1 przybliżonych wartości x na przedziale <a,b>
% y - wektor n + 1 przybliżonych wartości y na przedziale <a,b>
% dy - wektor n + 1 przybliżonych wartości y' na przedziale <a,b>
% ddy - wektor n + 1 przybliżonych wartości y'' na przedziale <a,b>

% w celu ułatwienia wywoływania funkcji argument b2m ma podstwową
% wartość 1 (nie jest to arguent należący do "właściwej funkcji" lecz
% do jej modyfikacji)
arguments
    a0,a1,a2,rhs,y0,dy0,a,b,n,kor,b2m = 1
end

h = (b-a)/n; % krok metody
Yn = zeros(4,n + 1); % wektor przybliżeń rozwiązań równania
Ynk = zeros(4,1); % wektor pomocniczy używany w metodzie predyktor-korektor
Yn(:,1) = [a;y0;dy0;0]; % ustawienie początkowej wartości wektoru Yn
k = 3; % parametr odpowiadający za ilość przybliżeń
% uzyskanych metodą Rungego-Kutty
if kor == -1 % if ustawiający wartość k na n gdy kor == -1
    k = n;
end

% funkcja 3 argumentów wykorzystywana w poniższych metodach
f = @(X,Y,DY) ([1;DY;((-a1(X)*DY-a0(X)*Y + rhs(X))/(a2(X)));0]);

% pętla obliczająca początkowe 3 (albo wszystkie w przypadku kor == -1)
% przybliżenia rozwiązania równania przy użyciu metody Rungego-Kutty
for i = 2 : k + 1
    k1 = h*f(Yn(1,i-1),Yn(2,i-1),Yn(3,i-1));
    k2 = h*f(Yn(1,i-1) + h/2,(Yn(2,i-1) + k1(2)/2),(Yn(3,i-1) + k1(3)/2));
    k3 = h*f(Yn(1,i-1) + h/2,(Yn(2,i-1) + k2(2)/2),(Yn(3,i-1) + k2(3)/2));
    k4 = h*f(Yn(1,i-1) + h,(Yn(2,i-1) + k3(2)),(Yn(3,i-1) + k3(3)));
    Yn(:,i) = Yn(:,i-1) + (1/6) .* (k1 + 2 .* k2 + 2 .* k3 + k4);
    DDY = f(Yn(1,i),Yn(2,i),Yn(3,i));
    Yn(4,i) = DDY(3,1);
end

if kor ~= -1 % if sprawdzający czy mamy obliczać końcowe przybliżenia
    % metodą inną niż Rungego-Kutty
    for i = 5 : n + 1
        % Pętla obliczająca wartość predyktora / przybliżenia metodą
        % Addamsa - Bashforda
        Ynk(:,1) = Yn(:,i-1) + (h/24) .* ( ...
            55 .* f(Yn(1,i-1),Yn(2,i-1),Yn(3,i-1)) ...
            -59 .* f(Yn(1,i-2),Yn(2,i-2),Yn(3,i-2)) ...
            + 37 .* f(Yn(1,i-3),Yn(2,i-3),Yn(3,i-3)) ...
            -9 .* f(Yn(1,i-4),Yn(2,i-4),Yn(3,i-4)));
        DDY = f(Ynk(1,1),Ynk(2,1),Ynk(3,1));
        Ynk(4,1) = DDY(3,1);
        if kor == 1 && mod(i-4,b2m) == 0 % if sprawdzający czy ma zostać
            % dokonana kroekcja i czy odpowiednią ilość
            % razy została wykonana predykcja
            Yn(:,i) = Yn(:,i-1) + (h/24) .* ( ...
                9 .* f(Ynk(1,1),Ynk(2,1),Ynk(3,1)) ...
                + 19 .* f(Yn(1,i-1),Yn(2,i-1),Yn(3,i-1)) ...
                -5 .* f(Yn(1,i-2),Yn(2,i-2),Yn(3,i-2)) ...
                + 1 .* f(Yn(1,i-3),Yn(2,i-3),Yn(3,i-3)) );
            DDY = f(Yn(1,i),Yn(2,i),Yn(3,i));
            Yn(4,i) = DDY(3,1);
        else
            % przepisanie wartości predyktora w przypadku gdy
            % przybliżamy metodą Addamsa-Bashforda
            Yn(:,i) = Ynk(:,1);
        end
    end
end

% przepisanie obliczonych wartości do wektorów wynikowych
x = Yn(1,:);
y = Yn(2,:);
dy = Yn(3,:);
ddy = Yn(4,:);

end %function