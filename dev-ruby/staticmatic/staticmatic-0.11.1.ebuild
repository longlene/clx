# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Lightweight Static Site Framework"
HOMEPAGE="http://staticmatic.net"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/haml-2.0.0"
ruby_add_rdepend ">=dev-ruby/rack-1.0"
ruby_add_rdepend ">=dev-ruby/compass-0.10.0"

