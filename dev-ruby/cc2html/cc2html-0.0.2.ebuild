# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Converts an IMS Common Cartridge package to a self-contained web site or epub"
HOMEPAGE="https://github.com/bracken/cc2html"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubyzip-0"
ruby_add_rdepend ">=dev-ruby/happymapper-0"
ruby_add_rdepend ">=dev-ruby/builder-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/rdiscount-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/guard-bundler-0"
ruby_add_rdepend ">=dev-ruby/guard-minitest-0"

