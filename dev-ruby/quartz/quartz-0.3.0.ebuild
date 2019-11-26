# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A gem for calling Go code from Ruby"
HOMEPAGE="http://github.com/DavidHuie/quartz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jeweler-2.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/ruby-prof-0.15"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9"
ruby_add_rdepend ">=dev-ruby/multi_json-1.4"

