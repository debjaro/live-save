DESTDIR=/
build:
	true
install:
	mkdir -p $(DESTDIR)/usr/bin
	mkdir -p $(DESTDIR)/etc/systemd/system
	mkdir -p $(DESTDIR)/etc/init.d/
	install live-save.sh $(DESTDIR)/usr/bin/live-save
	install live-save.service $(DESTDIR)/etc/systemd/system/live-save.service
	install live-save.init $(DESTDIR)/etc/init.d/live-save
