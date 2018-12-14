
# apt-get short-cuts
alias lookfor='apt-cache search'
alias gimme='sudo apt-get -y install'
alias devlab='/usr/local/bin/sna-hosts -d devlab.sinenomine.net -n 192.168.96.4'

# wiki
alias iki='ikiwiki --setup ~/openafs-wiki.setup --rebuild'

# dev
alias cs='cscope -R'

# editing
alias af='/usr/bin/perl -w -MText::Autoformat -e "autoformat {all => 1, mail => 1};"'

# taskwarrior
alias t='task limit:7 next'
alias tt='task +TODAY next'

# kinit/aklog
alias ak='pass sna/krb5/mmeffie | kinit mmeffie@SINENOMINE.NET && aklog -c sinenomine.net'
alias ak-admin='pass sna/krb5/mmeffie.admin | kinit mmeffie/admin@SINENOMINE.NET && aklog -c sinenomine.net'

