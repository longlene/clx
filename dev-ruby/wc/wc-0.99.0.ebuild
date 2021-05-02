# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="your ruby word counter experience"
HOMEPAGE="http://github.com/thesp0nge/wc"

LICENSE="new BSD License"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-2.3.0"
ruby_add_rdepend ">=dev-ruby/yard-0.6.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.6.2"
ruby_add_rdepend ">=dev-ruby/rcov-0"

