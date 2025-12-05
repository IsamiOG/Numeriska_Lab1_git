clc, clearvars, close all
%{
function m = matris_maunal%skapar och skickar tillbaka starttillstånd i från figur 3 i uppgiften
    a = zeros(16);
    a(5:9,5)=1; a(5,7:11)=1; a(11,5:9)=1; a(7:11,11)=1;
    m=a;
end
%}
function main()
    load puffer.mat
    b=A;
    sz=size(b);%(antal rader, antal kolumnerm)
    a=zeros(sz(1)+2,sz(2)+2);
    a((2:end-1),(2:end-1))=b; %matris a är en noll matris som vi lägger matris b i med en ram av nollor kvar
    in=input("Hur många generationer ska koden köras för? (snälla skriv en siffra) ");
    %in=10000;
    %a=matris_maunal;
    sz=size(a);
    spy(a(2:end-1,2:end-1),6,'k')
    drawnow
    k=0;
    while k<in %lopa igenom för antal generationer
        b=[]; %Matris som kommer hålla antal grannar
        i=2; %Lopa igenom matrisen
        while i<=sz(1)-1 %Ingen ram
            j=2;
            while j<=sz(2)-1 %Ingen ram
                b(i,j)=antalgrannar(a,i,j);
                j=j+1;
            end
            i=i+1;
        end
        %matris a är celler och matris b är antal grannar
        %Har kollat alla grannar här
        i=2; %Lopa igenom matrisen igen för att ändra matrisen efter levandsregler
        while i<=sz(1)-1
            j=2;
            while j<=sz(2)-1
                a(i,j)=levnadsregler(a(i,j),b(i,j));
                j=j+1;
            end
            i=i+1;
        end
        k=k+1;
        if mod(k,1)==0 %Hela if-satsen är för att visa matrisen, om man vill ändra antal steg mellan att den visar så ska andra input i mod ändras
            spy(a(2:end-1,2:end-1),6,'k') 
            drawnow
        end
    end
end

main()