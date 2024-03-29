# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Sunspot::Solr provides a bundled Solr distribution for use with Sunspot"
HOMEPAGE="https://github.com/sunspot/sunspot/tree/master/sunspot_solr"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-11.1.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.4.0"

