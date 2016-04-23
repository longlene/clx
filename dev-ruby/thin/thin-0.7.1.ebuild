# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A thin and fast web server"
HOMEPAGE="http://code.macournoyer.com/thin/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-0.2.0"
ruby_add_rdepend ">=dev-ruby/daemons-1.0.9"
ruby_add_rdepend ">=dev-ruby/eventmachine-0.10.0"

