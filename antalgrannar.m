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
