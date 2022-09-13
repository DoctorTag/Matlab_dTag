function [resType,rxdata,rxlen] =frameDecode(raw,rst)
persistent rx_state offset fBuf
rxdata = [];
rxlen = 0;
%dType = 0;
if rst > 0
    rx_state = 0;
    offset = 1;
    fBuf = uint8(1:2000);
end

dlen = length(raw);

if(dlen > 0)

    tmplen = 1;

    while tmplen <= dlen
        tmp = char(sprintf("%02x",raw(tmplen)));
        if (length(tmp) > 2)
            fBuf(tmplen) = uint8(hex2dec(tmp(3:4))) ;
        else
            fBuf(tmplen) = uint8(hex2dec(tmp)) ;
        end

        switch rx_state
            case 0  % rx_header 0x55
                if fBuf(offset) == uint8(hex2dec('55'))
                    rx_state = rx_state+1;
                end
            case 1  % rx_cmd
                rx_state = rx_state+1;
            case 2  % rxdata_length_H
                rx_state = rx_state+1;
            case 3  % rxdata_length_L
                rx_state = rx_state+1;

            case 4 % rxdata
                if (bitshift(uint32(fBuf(3)), 8)+ uint32(fBuf(4))) == (offset-4)
                    rx_state = rx_state+1;
                end
            case 5  % rxCRC
                rx_state = rx_state+1;
            case 6  % rx_End
                if fBuf(offset) == uint8(hex2dec('0a'))
                    rxdata = fBuf(5:(offset-2));
                    rxlen = offset-6;
                    resType = fBuf(2);
                else
                    rxdata = [];
                    rxlen = 0;
                    disp('Frame format error ')
                end
                rx_state = 0;
                offset = 1;
                return;

        end

        offset = offset+1;
        tmplen = tmplen + 1;
    end
end