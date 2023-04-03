# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Expand the 'vagrant box' command to support the creation of base boxes from scratch"
HOMEPAGE="http://github.com/minihub/vbox/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/vagrant-0.8.2"
ruby_add_rdepend ">=dev-ruby/net-ssh-2.1.0"
ruby_add_rdepend ">=dev-ruby/popen4-0.1.2"
ruby_add_rdepend ">=dev-ruby/thor-0.14.6"
ruby_add_rdepend ">=dev-ruby/highline-1.6.1"
ruby_add_rdepend ">=dev-ruby/progressbar-0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.0.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.5.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"

