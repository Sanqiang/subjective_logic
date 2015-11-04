function triple = intersect_sl(triple1, triple2)
triple = zeros(3,1);
if 0
    triple(1) = triple1(1) * triple2(1);
    triple(2) = triple1(2) + triple2(2) - triple1(2)*triple2(2);
    triple(3) = triple1(1)*triple2(3) + triple2(1)*triple1(3) + triple2(3)*triple1(3);
end

if 1
    triple(1) = (triple1(1) + triple2(1))/2;
    triple(2) = (triple1(2) + triple2(2))/2;
    triple(3) = (triple1(3) + triple2(3))/2;
end

end