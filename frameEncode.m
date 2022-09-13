function txFdata=frameEncode(cmd,data)

if(~isinteger(cmd))
    %  txFdata=[];
    error('cmd must be uint8');
end
dlen = length(data);
if(dlen > 1)
    if(~isinteger(data))
        % txFdata=[];
        error('data must be uint8');
    end
end

txFdata=uint8(1:(5+dlen));
txFdata(1) = uint8(hex2dec('55'));
txFdata(2) = uint8(cmd);
txFdata(3) = uint8(dlen);
txFdata(4:(3+dlen)) = uint8(data);
fTxCrc = txFdata(1);
for n = 2:(dlen+3)
    fTxCrc = uint8(bitxor(fTxCrc,txFdata(n)));
end
txFdata(4+dlen) = uint8(fTxCrc);
txFdata(5+dlen) = uint8(hex2dec('0A'));
