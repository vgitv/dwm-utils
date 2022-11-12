desktop := /usr/share/xsessions/dwm.desktop
directories := /usr/local/share/dwm

sourcebin := $(wildcard bin/*)
targetbin := $(subst bin/,/usr/local/bin/,$(sourcebin))

sourcepng := $(wildcard wallpaper/*)
targetpng := $(subst wallpaper/,/usr/local/share/dwm/,$(sourcepng))

install: $(desktop) $(directories) $(targetbin) $(targetpng)

print:
	@echo 'sourcebin:'
	@echo $(sourcebin)
	@echo -e '\ntargetbin:'
	@echo $(targetbin)

/usr/local/bin/%: bin/%
	cp $^ $@ && chmod 755 $@

/usr/share/xsessions/dwm.desktop: desktop/dwm.desktop
	cp $^ $@ && chmod 644 $@

/usr/local/share/dwm/%: wallpaper/%
	cp $^ $@ && chmod 644 $@

/usr/local/share/dwm:
	mkdir $@

.PHONY: clean
clean:
	rm -f $(targetbin)
	rm -f /usr/share/xsessions/dwm.desktop
	rm -rf /usr/local/share/dwm
