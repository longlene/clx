# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Sunspot is a library providing a powerful, all-ruby API for the Solr search engine"
HOMEPAGE="http://outoftime.github.com/sunspot"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pr_geohash-1.0"
ruby_add_rdepend ">=dev-ruby/rsolr-1.0.7"

