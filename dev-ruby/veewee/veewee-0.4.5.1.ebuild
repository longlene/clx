# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Expand the 'vagrant box' command to support the creation of base boxes from scratch"
HOMEPAGE="http://github.com/jedi4ever/veewee/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/net-ssh-2.2.0"
ruby_add_rdepend ">=dev-ruby/mime-types-1.16"
ruby_add_rdepend ">=dev-ruby/popen4-0.1.2"
ruby_add_rdepend ">=dev-ruby/thor-0.15"
ruby_add_rdepend ">=dev-ruby/highline-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/progressbar-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/ansi-1.3.0"
ruby_add_rdepend ">=dev-ruby/ruby-vnc-1.0.0"
ruby_add_rdepend ">=dev-ruby/fog-1.8"
ruby_add_rdepend ">=dev-ruby/childprocess-0"
ruby_add_rdepend ">=dev-ruby/grit-0"
ruby_add_rdepend "=dev-ruby/fission-0.5.0"
ruby_add_rdepend ">=dev-ruby/to_slug-0"
ruby_add_rdepend ">=dev-ruby/os-0.9.6"
ruby_add_rdepend ">=dev-ruby/rspec-2.5"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"

