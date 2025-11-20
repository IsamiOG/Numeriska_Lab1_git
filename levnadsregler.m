function a = levnadsregler(b, d)%funktion som tar in en matris(b), ett index matrisen (rad, kol) och d som säger om index ska ändras och vad det ska ändras till. Kan sätta d till antal grannar vid ett index
    if b==1 %olika situation om det finns en levande cell i index eller inte
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

