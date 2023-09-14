# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rack middleware for Linked Data content negotiation"
HOMEPAGE="http://ruby-rdf.github.com/rack-linkeddata"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/linkeddata-2.0"
ruby_add_rdepend ">=dev-ruby/rack-1.6"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"

