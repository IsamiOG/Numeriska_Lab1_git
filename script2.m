clc, clearvars, close all
function main_2()
    %a=matris_maunal;
    load puffer.mat
    a=A;
    %in=input("Hur många generationer ska koden köras för? (snälla skriv en siffra) ");
    in=input("何世代、先までお見せいたしましょうか？（番号でお願いします）");
    %in=10000;
    spy(a,6,'k')
    drawnow
    sz=size(a);%(antal rader, antal kolumnerm)
    %plot(a)
    k=0;
    while k<in %lopa igenom för antal generationer
        b=[];
        i=1; %Lopa igenom matrisen
        while i<=sz(1)
            j=1;
            while j<=sz(2)
                b(i,j)=antalgrannar_2(a,i,j,sz);%kolla om i och j ska byta plats
                j=j+1;
            end
            i=i+1;
        end
        %om man vill kolla b här -> spy(b)
        i=1; %Lopa igenom matrisen
        while i<=sz(1)
            j=1;
            while j<=sz(2)
                a(i,j)=levnadsregler(a(i,j),b(i,j));
                j=j+1;
            end
            i=i+1;
        end
        k=k+1;
        if mod(k,1)==0 %Hela if-satsen är för att visa matrisen, om man vill ändra antal steg mellan att den visar så ska andra input i mod ändras
            spy(a,6,'k') %Ändra till plot
            drawnow
            %plot(a)
            %pause
        end
    end
end
main_2()