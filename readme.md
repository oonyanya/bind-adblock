# �g����

## name.conf��ݒ肷��

BIND9.8.8.�ȍ~���_�E�����[�h���Z�b�g�A�b�v����B
��WindowsXP�̏ꍇ�ABIND9.11.1.xp�ȍ~�͓����Ȃ��̂ŁAhttps://ftp.iij.ad.jp/pub/network/isc/bind9/9.11.1/���痎�Ƃ����ƁB
name.conf��directory��K�؂Ȓl�ɏ���������B

```name.conf
options {
    directory "c:\ProgramData\named"; 
    forwarders {
        192.168.3.1;
    };
    forward only;
    allow-query { any; };
    recursion yes;
    version "version: none";
    listen-on-v6{
        any;
    };
    response-policy {
        zone "rpz.zone";
    };
};
zone "rpz.zone" {
	type master;
	file "rpz.local";
	masterfile-format text;
	allow-query { none; };
};
zone "." {
    type hint;
    file "named.root";
};
```

https://www.internic.net/domain/named.root����name.conf��option��directory�Ŏw�肳�ꂽ�Ƃ���Ƀ_�E�����[�h����B

�Ȃ��A�Ȃɂ��K�[�h���ĂȂ��̂ŁAVPN���g���ȂǓK�؂ȑΉ����Ƃ邱�ƁB


## rpz.local���쐬����

https://280blocker.net����280blocker_domain.txt�𗎂Ƃ��B
���̍ہABOM�͂��Ȃ��ł��ƁB

���Y�t�@�C���𗎂Ƃ��I�������Aadd_blocklist.cmd��OUTPUT_FOLDER��K�؂ȏꏊ�ɏ��������A
add_blocklist.cmd��restart_dns.cmd�����s����B
