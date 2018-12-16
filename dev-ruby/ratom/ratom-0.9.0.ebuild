# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A fast Atom Syndication and Publication API based on libxml"
HOMEPAGE="http://github.com/seangeo/ratom"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/libxml-ruby-2.6"
ruby_add_rdepend ">=dev-ruby/bundler-1.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.10.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.6"

