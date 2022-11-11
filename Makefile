sourcebin := $(wildcard bin/*)
targetbin := $(subst bin/,/usr/local/bin/,$(sourcebin))

install: $(targetbin) /usr/share/xsessions/dwm.desktop /usr/local/share/dwm/dwm.png

print:
	@echo 'sourcebin:'
	@echo $(sourcebin)
	@echo -e '\ntargetbin:'
	@echo $(targetbin)

/usr/local/bin/%: bin/%
	cp $^ $@ && chmod 755 $@

/usr/share/xsessions/dwm.desktop: desktop/dwm.desktop
	cp $^ $@ && chmod 644 $@

/usr/local/share/dwm/dwm.png: /usr/local/share/dwm wallpaper/dwm.png
	cp wallpaper/dwm.png $@ && chmod 644 $@

/usr/local/share/dwm:
	mkdir $@

.PHONY: clean
clean:
	rm -f $(targetbin)
	rm -f /usr/share/xsessions/dwm.desktop
	rm -rf /usr/local/share/dwm
