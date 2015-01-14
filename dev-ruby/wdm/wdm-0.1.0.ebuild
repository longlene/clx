# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Windows Directory Monitor (WDM) is a library which can be used to monitor directories for changes"
HOMEPAGE="https://github.com/Maher4Ever/wdm"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-compiler-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/guard-shell-0"
ruby_add_rdepend ">=dev-ruby/rb-readline-0"
ruby_add_rdepend ">=dev-ruby/rb-notifu-0"
ruby_add_rdepend ">=dev-ruby/pimpmychangelog-0"

