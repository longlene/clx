# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="retrieve japanese address line from a web page or a string"
HOMEPAGE="http://github.com/sawamur/doko"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.8.0"
ruby_add_rdepend ">=dev-ruby/rdoc-3.12"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.8.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

