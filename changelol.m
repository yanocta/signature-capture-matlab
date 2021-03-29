function changelol(num)
pt = get(gca, 'CurrentPoint');
evalin('base',['a = a + 1;']);

if num == 1
    evalin('base',['mats(a,1) = ' mat2str(pt(1,1)) ';']);
    evalin('base',['mats(a,2) = ' mat2str(pt(1,2)) ';']);
    evalin('base',['mats(a,3) = toc(startTime);']);
elseif num == 2
    evalin('base',['mats(a,1:2) = [0 0];']);
    evalin('base',['mats(a,3) = toc(startTime);']);
end

end