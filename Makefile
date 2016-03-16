default: install-packages sync-tmux sync-vim

install-packages: 
	./install.sh

sync-tmux:
	test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	cp ./tmux/.tmux.conf ~/.tmux.conf
	tmux has-session -t install || tmux new-session -d -s install
	tmux source ~/.tmux.conf
	~/.tmux/plugins/tpm/bin/install_plugins
	tmux kill-session -t install

set-shell:
	chsh -s `which fish`

sync-vim:
	./vim/.vim/sync.sh
	python2 ~/.vim/plugged/YouCompleteMe/install.py
