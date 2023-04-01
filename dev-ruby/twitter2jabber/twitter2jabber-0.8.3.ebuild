# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Read Twitter streams through Jabber"
HOMEPAGE="http://github.com/blackwinter/twitter2jabber"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cyclops-0.2"
ruby_add_rdepend ">=dev-ruby/longurl-0.1"
ruby_add_rdepend ">=dev-ruby/xmpp4r-0.5"
ruby_add_rdepend ">=dev-ruby/twitter-5.0"
ruby_add_rdepend ">=dev-ruby/hen-0.8"
ruby_add_rdepend ">=dev-ruby/rake-0"

