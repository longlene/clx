# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This gem is a fork of sinatra-twitter-bootstrap remade for bootstrap 3"
HOMEPAGE="http://github.com/mateusmedeiros/sinatra-bootstrap"

LICENSE="Apache-2.0 WTFPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.0"
ruby_add_rdepend ">=dev-ruby/sinatra-outputbuffer-0"

