# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This gem allows easier implementation and utilization of distributed, federated social networks."
HOMEPAGE="http://github.com/hotsh/lotus"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/ratom-0.7.2"
ruby_add_rdepend ">=dev-ruby/rsa-0"
ruby_add_rdepend ">=dev-ruby/ruby-hmac-0"

