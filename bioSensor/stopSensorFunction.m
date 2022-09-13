function stopSensorFunction(con,funCmd)
if con >= 0
    if ~ischar(funCmd)
        error('funCmd must be char')
    end

    cmdID = dTagConst(funCmd);
    
    if cmdID < 0
        error('Get cmdID error,please confirm that funCmd is correct')
    end
    parabuf = uint8(1:3);
    parabuf(1) = 0;
    parabuf(2) = 0;
    parabuf(3) = 0;
    pnet(con,'write' ,frameEncode(uint8(cmdID),parabuf));
   pnet(con,'setreadtimeout',1);
   pnet(con,'read' ,'uint8');
else
    error('TcpHandle is null')
end