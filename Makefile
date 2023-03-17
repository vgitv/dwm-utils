sourcebin := $(wildcard bin/*)
targetbin := $(subst bin/,/usr/local/bin/,$(sourcebin))

install: $(targetbin) /usr/share/xsessions/dwm.desktop

print:
	@echo 'sourcebin:'
	@echo $(sourcebin)
	@echo -e '\ntargetbin:'
	@echo $(targetbin)

/usr/local/bin/%: bin/%
	cp $^ $@ && chmod 755 $@

/usr/share/xsessions/dwm.desktop: desktop/dwm.desktop
	cp $^ $@ && chmod 644 $@
