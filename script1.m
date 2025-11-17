clc, clearvars, close all
function m = matris_maunal%skapar och skickar tillbaka starttillstånd i från figur 3 i uppgiften
    a = zeros(16);
    a(5:9,5)=1; a(5,7:11)=1; a(11,5:9)=1; a(7:11,11)=1;
    m=a;
end
%kolla med lärare om man får ändra input variabler från A till a
function antal = antalgrannar(A, rad, kol, sz) %funktion som ska ta in en matris(A) och index till matrisen (rad och kol) och ange antal grannar till den punkten. La till sz(size) men vet inte om det är tillåtet
    %måste göra något åt så man inte kollar utanför matris
    if rad==1 && kol==1 %börja med om i hörnen
        antal=A(rad,kol+1)+A(rad+1,kol+1)+A(rad+1,kol);
    elseif rad==1 && kol==sz(2)
        antal=A(rad,kol-1)+A(rad+1,kol-1)+A(rad+1,kol);
    elseif rad==sz(1) && kol==sz(2)
        antal=A(rad-1,kol-1)+A(rad-1,kol)+A(rad,kol-1);
    elseif rad==sz(1) && kol==1
        antal=A(rad-1,kol)+A(rad-1,kol+1)+A(rad,kol+1);
    elseif rad==1 %kolla längs väggarna
        antal=A(rad,kol-1)+A(rad,kol+1)+A(rad+1,kol-1)+A(rad+1,kol)+A(rad+1,kol+1);
    elseif rad==sz(1)
        antal=A(rad,kol-1)+A(rad,kol+1)+A(rad-1,kol-1)+A(rad-1,kol)+A(rad-1,kol+1);
    elseif kol==1
        antal=A(rad-1,kol)+A(rad-1,kol+1)+A(rad,kol+1)+A(rad+1,kol)+A(rad+1,kol+1);
    elseif kol==sz(2)
        antal=A(rad-1,kol)+A(rad-1,kol-1)+A(rad,kol-1)+A(rad+1,kol)+A(rad+1,kol-1);
    else %inte längs kant
        antal=A(rad-1,kol-1)+A(rad-1,kol)+A(rad-1,kol+1)+A(rad,kol-1)+A(rad,kol+1)+A(rad+1,kol-1)+A(rad+1,kol)+A(rad+1,kol+1);
    end
end
%går nog att ändra input b från en matris till ett nummer, då kan man nog ta bort rad, kol som input
function a = levnadsregler(b, rad, kol, d)%funktion som tar in en matris(b), ett index matrisen (rad, kol) och d som säger om index ska ändras och vad det ska ändras till. Kan sätta d till antal grannar vid ett index
    if b(rad,kol)==1 %olika situation om det finns en levande cell i index eller inte
        if d==2 || d==3
            a=1;
        else
            a=0;
        end
    else
        if d==3
            a=1;
        else
            a=0;
        end
    end
end
function main()
    load puffer.mat
    %a=matris_maunal;
    a=A;
    spy(a)
    pause
    sz=size(a);%(antal rader, antal kolumnerm)
    %behöver lopa igenom hela matrisen och få grannar på varje index på matrisen
    k=0;
    c=0;%bara för testing, går att ta bort om man bara vill ha slutresultat
    while k<10000
        b=[];
        i=1;
        while i<=sz(1)
            j=1;
            while j<=sz(2)
                b(i,j)=antalgrannar(a,i,j,sz);%kolla om i och j ska byta plats
                j=j+1;
            end
            i=i+1;
        end
        %spy(b)
        i=1;
        while i<=sz(1)
            j=1;
            while j<=sz(2)
                a(i,j)=levnadsregler(a,i,j,b(i,j));
                j=j+1;
            end
            i=i+1;
        end
        k=k+1;
        c=c+1;
        if c==1 %hela if statsen är bara för att visa ändring för felsökning
            c=0;
            spy(a)
            pause(0.01)
        end
        %spy(a)
        %pause
    end
    spy(a)
end
main()