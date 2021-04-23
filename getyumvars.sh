/usr/bin/python -c 'import yum;yb=yum.YumBase();yb.doConfigSetup(init_plugins=False);print yb.conf.yumvar["releasever"]'
6Server
/usr/bin/python -c 'import yum;yb=yum.YumBase();yb.doConfigSetup(init_plugins=False);print yb.conf.yumvar["basearch"]'
x86_64

generic vesion:   VARNAME should be the name of the yum variable you want.  Ie.   VARNAME="basearch" to get $basearch you use in the yum url.
VARNAME="variablename"; /usr/bin/python -c 'import yum;yb=yum.YumBase();yb.doConfigSetup(init_plugins=False);print yb.conf.yumvar["$VARMAME"]'

