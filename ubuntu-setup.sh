
# sudo aptitude install ssh
# sudo /etc/init.d/ssh reload

mkdir sources

sudo aptitude -y update
sudo aptitude -y safe-upgrade
sudo aptitude -y full-upgrade
sudo aptitude -y install build-essential cmake wget ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8 libreadline-ruby1.8 libruby1.8 libopenssl-ruby sqlite3 libsqlite3-ruby1.8 

sudo ln -s /usr/bin/ruby1.8 /usr/bin/ruby
sudo ln -s /usr/bin/ri1.8 /usr/bin/ri
sudo ln -s /usr/bin/rdoc1.8 /usr/bin/rdoc
sudo ln -s /usr/bin/irb1.8 /usr/bin/irb

cd sources
wget http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz
tar xzf rubygems-1.3.5.tgz
cd rubygems-1.3.5
sudo ruby setup.rb
cd ../..

sudo ln -s /usr/bin/gem1.8 /usr/bin/gem

sudo gem update
sudo gem update --system

sudo aptitude install -y libqt4-core libqt4-dbg libqt4-dev libqt4-deb-dbg libqt4-gui libqt4-network libqt4-ruby libqt4-ruby1.8 libqt4-ruby1.8-dev libqt4-webkit libqt4-webkit-dbg libqt4-xml lsb-qt4 qt4-dev-tools qt4-dev-tools-dbg qt4-qmake qt4-qtconfig xvfb

sudo gem install straight_shooter