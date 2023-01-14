install:
	@mkdir -p ~/.config/fish/{conf.d,functions};
	@ln -svf $(CURDIR)/conf.d/* ~/.config/fish/conf.d;
	@ln -svf $(CURDIR)/functions/* ~/.config/fish/functions;
	@ln -svf $(CURDIR)/fish_plugins ~/.config/fish/fish_plugins;
