function [resType,resData,rlen] = readSensorReg(con,regAddr)

parabuf = uint8(1:3);
parabuf(1) = uint8(regAddr);
parabuf(2) = 0;
parabuf(3) = 0;
[resType,resData,rlen] =startSensorFunction(con,'H_CMD_READ_REG',parabuf,1,2);