# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Primary NER component that wraps the various NER kernels"
HOMEPAGE=""

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opener-ner-base-3.0"
ruby_add_rdepend ">=dev-ruby/opener-daemons-2.2"
ruby_add_rdepend ">=dev-ruby/opener-webservice-2.1"
ruby_add_rdepend ">=dev-ruby/opener-core-2.2"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

