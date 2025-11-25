function antal = antalgrannar(A, rad, kol) %funktion som ska ta in en matris(A) och index till matrisen (rad och kol) och ange antal grannar till den punkten. La till sz(size) men vet inte om det är tillåtet
    antal=A(rad-1,kol-1)+A(rad-1,kol)+A(rad-1,kol+1)+A(rad,kol-1)+A(rad,kol+1)+A(rad+1,kol-1)+A(rad+1,kol)+A(rad+1,kol+1);
end