# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Constituent parser including a webservice"
HOMEPAGE=""

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opener-constituent-parser-base-1.0"
ruby_add_rdepend ">=dev-ruby/opener-constituent-parser-nl-1.0"
ruby_add_rdepend ">=dev-ruby/opener-constituent-parser-de-1.1"
ruby_add_rdepend ">=dev-ruby/opener-daemons-2.2"
ruby_add_rdepend ">=dev-ruby/opener-webservice-2.1"
ruby_add_rdepend ">=dev-ruby/opener-core-2.2"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/slop-3.5"
ruby_add_rdepend ">=dev-ruby/rake-0"

