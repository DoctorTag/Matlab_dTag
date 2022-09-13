function val=dTagConst(constName)

switch constName

    case 'H_CMD_FIRMWARE_BIO'
        val = int16(1);

        % H_CMD_PPG code is 0x02
    case 'H_CMD_PPG'
        val = int16(2);

        % H_CMD_ECG code is 0x03
    case 'H_CMD_ECG'
        val = int16(3);

    case 'H_CMD_READ_REG'
        val = int16(5);

    case 'H_CMD_WRITE_REG'
        val = int16(6);



        %dTag Register map define

        %dTag Register   REG_MAP_CFMODE   1
    case 'REG_MAP_CFMODE'
        val = int16(1);
        %dTag Register   REG_MAP_AD_RATE  2
    case 'REG_MAP_AD_RATE'
        val = int16(2);
        %dTag Register   REG_MAP_AD_CH    3
    case 'REG_MAP_AD_CH'
        val = int16(3);
        %dTag Register   REG_MAP_AD_PGA	  4
    case 'REG_MAP_AD_PGA'
        val = int16(4);
        %dTag Register   REG_MAP_DA_IR    5
    case 'REG_MAP_DA_IR'
        val = int16(5);
        %dTag Register   REG_MAP_DA_R	  6
    case 'REG_MAP_DA_R'
        val = int16(6);
        %dTag Register   REG_MAP_DA_G	  7
    case 'REG_MAP_DA_G'
        val = int16(7);
        %dTag Register   REG_MAP_OPA_GAIN 8
    case 'REG_MAP_OPA_GAIN'
        val = int16(8);
        %dTag Register   REG_MAP_OPA_SW0  9
    case 'REG_MAP_OPA_SW0'
        val = int16(9);
        %dTag Register   REG_MAP_OPA_SW1  10
    case 'REG_MAP_OPA_SW1'
        val = int16(10);
        %dTag Register   REG_MAP_OPA_SW2  11
    case 'REG_MAP_OPA_SW2'
        val = int16(11);
        %dTag Register   REG_MAP_CFUN     12
    case 'REG_MAP_CFUN'
        val = int16(12);
        %dTag Register   REG_MAP_COP      13
    case 'REG_MAP_COP'
        val = int16(13);
        %dTag Register   REG_MAP_MAX      13
    case 'REG_MAP_MAX'
        val = int16(13);
    case 'REG_ONLY_RD_MAX'
        val = int16(7);

        %dTag control  FUN_ADC_BIT            0x10
    case 'FUN_ADC_BIT'
        val = int16(hex2dec('10'));
        %dTag control  DEV_FUN_START		  0x01
    case 'DEV_FUN_START'
        val = int16(hex2dec('01'));
        %dTag control  DATA_RAW				  0x02
    case 'DATA_RAW'
        val = int16(hex2dec('02'));

    otherwise
        disp('constName is error')
        val = int16(-1);

end