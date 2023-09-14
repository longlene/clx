# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides common authentication needs such as signing in/out, activating by email and resetting password"
HOMEPAGE="https://github.com/Sorcery/sorcery"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/oauth-0.4"
ruby_add_rdepend ">=dev-ruby/oauth2-1.0"
ruby_add_rdepend ">=dev-ruby/bcrypt-3.1"
