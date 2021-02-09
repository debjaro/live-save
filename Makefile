DESTDIR=/
build:
	true
install:
	mkdir -p $(DESTDIR)/usr/bin
	mkdir -p $(DESTDIR)/etc/systemd/system
	install live-save.sh $(DESTDIR)/usr/bin/live-save
	install live-save.service $(DESTDIR)/etc/systemd/system/live-save.service
