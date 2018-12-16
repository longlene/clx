# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Records the results of every line of code in your file"
HOMEPAGE="https://github.com/JoshCheek/seeing_is_believing"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/parser-2.2"
ruby_add_rdepend ">=dev-ruby/psych-2.0"
ruby_add_rdepend ">=dev-ruby/pry-0.10.0"
ruby_add_rdepend ">=dev-ruby/haiti-0.1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.2"
ruby_add_rdepend ">=dev-ruby/ichannel-5.1"

