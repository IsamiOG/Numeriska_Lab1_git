function a = levnadsregler(b, d)%Tar in två tal där b kan vara 0 eller 1 (representerar om det finns en cell eller inte) och d kan vara 0 till 8 (representerar antal grannar till b)
    if b==1 %Kollar om det finns en cell på index vi ska ändra, if true är att det finns en cell på index
        if d==2 || d==3 %Är villkoret för att cellen ska få leva uppfyllt?
            a=1;
        else
            a=0;
        end
    else %Finns inte en cell på index
        if d==3 %Är villkoret för att en cell ska födas uppfyllt?
            a=1;
        else
            a=0;
        end
    end
end