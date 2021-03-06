%ROLL THE TAPE
previmage = [];
for i=1:50
    a = getImage(i);
    mask = getMask(i);
    
    [A,B] = getCleanPlane(i);
    
    if numel(A) == 0
        %imshow(a);
        pause(0.1);
        continue
    end
    curi = i;
    count = 1;
    for i=1:424
        for j=1:512
            if mask(i,j)
                point = a(i,j,:);
                if ~(point(1)<=0 && point(2)<=0 && point(3)<=0);
                if B(count)==1
                    a(i,j,:) = [255 0 0];
                elseif B(count)==2
                    a(i,j,:) = [0 0 255];
                elseif B(count)==3
                    a(i,j,:) = [0 255 0];
                elseif B(count)==-1
                    a(i,j,:) = [255 255 0];
                end
                count = count + 1;
                end
            end
        end
    end
    if numel(previmage) == 0
        previmage = a;
        continue
    end
    [curi-1 curi]
    a2 = cat(2, previmage, a);
    previmage = a;
    imshow(a2);
    pause();
end
reload;