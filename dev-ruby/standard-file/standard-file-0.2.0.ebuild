# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Standard File allows for storage, sync, and encryption of items such as notes, tags, and any other models with a custom schema"
HOMEPAGE="https://standardnotes.org"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-5.0.1"
ruby_add_rdepend ">=dev-ruby/jwt-1.5.0"
ruby_add_rdepend ">=dev-ruby/bcrypt-3.1"

