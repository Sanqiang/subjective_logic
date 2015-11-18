function [ matrix ] = GenerateRandomBigMatrix( expId, aSize,rSize )
    trend=rand(1,aSize);
    for i=1:aSize
        if trend(i)>0.5
            trend(i)=1;
        else
            trend(i)=-1;
        end
    end
    disp(trend);
    % exp1: 90% good reviews, 10% bad reviews
    if expId==1
        emptyProb=0.2;
        sopportTrendProb=0.7;
        againstTrendProb=0.1;
        goodProb=0.9;
        badProb=0.1;
        matrix=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize);
    % exp2: 90% good reviews, 10% bad reviews
    elseif expId==2
        emptyProb=0.2;
        sopportTrendProb=0.5;
        againstTrendProb=0.3;
        goodProb=0.9;
        badProb=0.1;
        matrix=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize);
    % exp3: 90% good reviews, 10% bad reviews
    elseif expId==3
        emptyProb=0.7;
        sopportTrendProb=0.2;
        againstTrendProb=0.1;
        goodProb=0.9;
        badProb=0.1;
        matrix=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize);
    % exp4: 90% good reviews, 10% bad reviews
    elseif expId==4
        emptyProb=0.2;
        sopportTrendProb=0.45;
        againstTrendProb=0.35;
        goodProb=0.9;
        badProb=0.1;
        matrix1=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize*0.5);
        sopportTrendProb=0.7;
        againstTrendProb=0.1;
        matrix2=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize*0.2);
        sopportTrendProb=0.45;
        againstTrendProb=0.35;
        matrix3=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize*0.3);
        matrix=[matrix1,matrix2,matrix3];
    % exp6: 90%->10%->90% good reviews, 10%->90%-10% bad reviews
    elseif expId==6
        emptyProb=0.2;
        sopportTrendProb=0.7;
        againstTrendProb=0.1;
        goodProb=0.9;
        badProb=0.1;
        matrix1=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize*0.5);
        goodProb=0.1;
        badProb=0.9;
        matrix2=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize*0.2);
        goodProb=0.9;
        badProb=0.1;
        matrix3=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize*0.3);
        matrix=[matrix1,matrix2,matrix3];
    end
    
    
end
function matrix=GetMatrix(emptyProb,sopportTrendProb,againstTrendProb,goodProb,badProb,trend,aSize,rSize)  
    if (goodProb+badProb)~=1
        disp('error error error error error error error ');
    end
    if (sopportTrendProb+againstTrendProb+emptyProb)~=1
        disp('error error error error error error error ');
    end
    matrix=zeros(aSize,rSize); 
    for i=1:rSize
        seed=rand(1);
        if seed<goodProb%good
            for j=1:aSize
                seed=rand(1);
                if seed<emptyProb
                    matrix(j,i)=0;
                elseif seed<(emptyProb+sopportTrendProb)
                    matrix(j,i)=trend(j);
                else
                    matrix(j,i)=-trend(j);
                end
            end
        else%bad
            for j=1:aSize
                seed=rand(1);
                if seed<emptyProb
                    matrix(j,i)=0;
                elseif seed<(emptyProb+againstTrendProb)
                    matrix(j,i)=trend(j);
                else
                    matrix(j,i)=-trend(j);
                end
            end
            
        end
    end
end


