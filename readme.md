# 使い方


## name.confを設定する

BIND9.8.8.以降をダウンロードしセットアップする。
※WindowsXPの場合、BIND9.11.1.xp以降は動かないので、https://ftp.iij.ad.jp/pub/network/isc/bind9/9.11.1/から落とすこと。
name.confのdirectoryを適切な値に書き換える。

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

https://www.internic.net/domain/named.rootからname.confのoptionのdirectoryで指定されたところにダウンロードする。

なお、なにもガードしてないので、VPNを使うなど適切な対応をとること。


## rpz.localを作成する

もし、280blocker_domain.txtの内容が古かったら、280blocker_domain.txtを削除し、
https://280blocker.netから280blocker_domainほにゃらら.txtを落とし、
parse280blocker.ps1を実行する。
add_blocklist.cmdのOUTPUT_FOLDERを適切な場所に書き換え、add_blocklist.cmdとrestart_dns.cmdを実行する。


## user_block_domain.txtについて

このファイルに任意のドメインを追加することができる。
なお、UTF-8 BOMなしで保存しないとうまく動かないかもしれません。
