function [resType,resData,rlen] = startSensorFunction(con,funCmd,funPara,waitRes,waitSec)
resType = 0;
resData = [];
rlen = 0;
if con >= 0
    if ~ischar(funCmd)
        error('funCmd must be char')
    end

    cmdID = dTagConst(funCmd);

    if cmdID < 0
        error('Get cmdID error,please confirm that funCmd is correct')
    end

    if isempty(funPara)
        error('funPara can not be null')
    end

    pnet(con,'write' ,frameEncode(uint8(cmdID),funPara));

    if waitRes > 0
        pnet(con,'setreadtimeout',waitSec);
        raw=pnet(con,'read' ,'uint8');
        if ~isempty(raw)
           % disp(raw)
            [resType,resData,rlen] = frameDecode(raw,0);
         
        end
    end
else
    error('TcpHandle is null')
end